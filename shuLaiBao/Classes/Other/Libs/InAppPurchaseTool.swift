//
//  InAppPurchaseTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/3/11.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import Foundation
import StoreKit

class InAppPurchaseTool: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    
    
    // 各种状态的通知
    let kInAppProductPurchasedNotification = "InAppProductPurchasedNotification"
    let kInAppPurchaseFailedNotification   = "InAppPurchaseFailedNotification"
    let kInAppProductRestoredNotification  = "InAppProductRestoredNotification"
    let kInAppPurchasingErrorNotification  = "InAppPurchasingErrorNotification"
    
    // 产品的id
     var productAttay = ["com.conglebao.product.drawBackground",  "com.conglebao.product.huitailang", "com.conglebao.product.luckysheep", "com.conglebao.product.xiongda"]

    // 内购单例
    class var sharedInstance : InAppPurchaseTool {
        struct Static {
             static var instance: InAppPurchaseTool = InAppPurchaseTool()
        }
         return Static.instance
    }
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    func buyProduct(_ product: SKProduct) {
        print("发送付款请求到Apple")
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Error %@ \(error)")
        NotificationCenter.default.post(name: Notification.Name(rawValue: kInAppPurchasingErrorNotification), object: error.localizedDescription)
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("从apple得到请求信息")
        let count: Int = response.products.count
        if count > 0 {
            _ = response.products
            let validProduct: SKProduct = response.products[0]
            print(validProduct.localizedTitle)
            print(validProduct.localizedDescription)
            print(validProduct.price)
            buyProduct(validProduct);
        }
        else {
            print("没有产品")
        }
    }

    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("从Apple接受付款交易信息");
        
        for transaction: AnyObject in transactions {
            if let trans: SKPaymentTransaction = transaction as? SKPaymentTransaction {
                switch trans.transactionState {
                case .purchased:
                    print("支付成功")
                    
                    savePurchasedProductIdentifier(trans.payment.productIdentifier)
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: kInAppProductPurchasedNotification), object: nil)
                    
                    receiptValidation()
                    
                    break
                    
                case .failed:
                    print("支付失败")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: kInAppPurchaseFailedNotification), object: nil)
                    break
                    
                case .restored:
                    print("产品恢复成功!")
                    savePurchasedProductIdentifier(trans.payment.productIdentifier)
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    NotificationCenter.default.post(name: Notification.Name(rawValue: kInAppProductRestoredNotification), object: nil)
                    break
                    
                default:
                    break
                }
            }
            else {
                
            }
        }
    }
    
    func restoreTransactions() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
  
    func savePurchasedProductIdentifier(_ productIdentifier: String!) {
        UserDefaults.standard.set(productIdentifier, forKey: productIdentifier)
        UserDefaults.standard.synchronize()
    }
    
    func receiptValidation() {
        
        let receiptFileURL = Bundle.main.appStoreReceiptURL
        let receiptData = try? Data(contentsOf: receiptFileURL!)
        let recieptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        let jsonDict: [String: AnyObject] = ["receipt-data" : recieptString! as AnyObject, "password" : "dab3f8e770384d99ae7dda0096529a30" as AnyObject]
        
        do {
            let requestData = try JSONSerialization.data(withJSONObject: jsonDict, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let storeURL = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")!
            let storeRequest = NSMutableURLRequest(url: storeURL)
            storeRequest.httpMethod = "POST"
            storeRequest.httpBody = requestData
            
            let session = URLSession.shared
            let task = session.dataTask(with: storeURL, completionHandler: { (data, response, error) in
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print(jsonResponse)
                    if let date = self.getExpirationDateFromResponse(jsonResponse as! NSDictionary) {
                        print(date)
                    }
                } catch let parseError {
                    print(parseError)
                }

            })
            task.resume()
        } catch let parseError {
            print(parseError)
        }
    }
    
    func getExpirationDateFromResponse(_ jsonResponse: NSDictionary) -> Date? {
        
        if let receiptInfo: NSArray = jsonResponse["latest_receipt_info"] as? NSArray {
            
            let lastReceipt = receiptInfo.lastObject as! NSDictionary
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
            
            if let expiresDate = lastReceipt["expires_date"] as? String {
                let expirationDate: Date = formatter.date(from: expiresDate) as Date!
                return expirationDate
            }
            
            return nil
        }
        else {
            return nil
        }
    }
    
    func unlockProduct(_ productIdentifier: String!) {
        if SKPaymentQueue.canMakePayments() {
            let productID: NSSet = NSSet(object: productIdentifier)
            let productsRequest: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            productsRequest.delegate = self
            productsRequest.start()
            print("Fething Products")
        }
        else {
            print("Сan't make purchases")
            NotificationCenter.default.post(name: Notification.Name(rawValue: kInAppPurchasingErrorNotification), object: NSLocalizedString("CANT_MAKE_PURCHASES", comment: "Can't make purchases"))
        }
    }
    
    func drawBackgroundInAppPurchaseProduct(_ item:Int) {
         unlockProduct(productAttay[item])
    }
    
//    func paymentQueue(queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]){
//        print("移除交易")
//    }

    
  
 }
