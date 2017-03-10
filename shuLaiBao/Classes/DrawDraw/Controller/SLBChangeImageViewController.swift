//
//  SLBChangeImageViewController.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/20.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit
import StoreKit

class SLBChangeImageViewController: UIViewController,  UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let productIdStr = "com.conglebao.product.drawBackground"
    var ldHUD:LDHud!
    let notificationS = NSNotificationCenter.defaultCenter()
    let defalt = NSUserDefaults.standardUserDefaults()
    
    var slbChangeImageV:SLBChangeImageView!
    var productAttay = [ "com.conglebao.product.drawBackground",  "com.conglebao.product.huitailang", "com.conglebao.product.luckysheep", "com.conglebao.product.xiongda"]
    var imageArray = [UIImage(named: "HaiTun_00"), UIImage(named: "HaiTun_01"), UIImage(named: "HaiTun_02"), UIImage(named: "HaiTun_03"),UIImage(named: "HaiTun_04"),UIImage(named: "HaiTun_05"),UIImage(named: "HaiTun_06")]
    var imageBlock:((name:UIImage) ->Void)?
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        notificationS.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // 1.初始化视图
        setupView()
        
        // 2.内购通知
        notificationS.addObserver(self, selector: #selector(SLBChangeImageViewController.inAppPurchaseFailed), name: InAppPurchaseTool.sharedInstance.kInAppPurchaseFailedNotification, object: nil)
        
        notificationS.addObserver(self, selector: #selector(SLBChangeImageViewController.inAppPurchasePurchased), name: InAppPurchaseTool.sharedInstance.kInAppProductPurchasedNotification, object: nil)
        
        notificationS.addObserver(self, selector: #selector(SLBChangeImageViewController.inAppPurchaseError), name: InAppPurchaseTool.sharedInstance.kInAppPurchasingErrorNotification, object: nil)
        
        notificationS.addObserver(self, selector: #selector(SLBChangeImageViewController.inAppPurchaseRestored), name: InAppPurchaseTool.sharedInstance.kInAppProductRestoredNotification, object: nil)
     }
    
    // 恢复内购
    func reInPPPurchaseClick(){
        isParentOnly(0)
    }
    
    // 内购错误
    func inAppPurchaseError(){
        print("内购错误")
        ldHUD.removeFromSuperview()
        showAlertWithMessage(NSLocalizedString("connectFail", comment: ""))
    }
    
    // 内购失败
    func inAppPurchaseFailed(){
        print("失败")
        ldHUD.removeFromSuperview()
    }
    
    // 内购成功
    func inAppPurchasePurchased(){
        print("成功")
        ldHUD.removeFromSuperview()
        
        slbChangeImageV.myCollectionView.reloadData()
        
    }
    
    // 恢复内购成功
    func inAppPurchaseRestored(){
        print("恢复内购成功")
//        ldHUD.removeFromSuperview()
        slbChangeImageV.myCollectionView.reloadData()
    }
    
    
    func setupView(){
        slbChangeImageV = SLBChangeImageView(frame: view.bounds)
        slbChangeImageV.myCollectionView.dataSource = self
        slbChangeImageV.myCollectionView.delegate = self
        slbChangeImageV.myCollectionView.registerClass(SLBChangeImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(slbChangeImageV)
        slbChangeImageV.backBtn.addTarget(self, action: #selector(SLBChangeImageViewController.backBtnClick), forControlEvents: .TouchUpInside)
        slbChangeImageV.reInAppPurchase.addTarget(self, action: #selector(SLBChangeImageViewController.reInPPPurchaseClick), forControlEvents: .TouchUpInside)
    }
    
    //    MARK:- 返回按钮点击事件
    func backBtnClick(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK:- UICollectionView的代理方法和数据源方法
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SLBChangeImageCollectionViewCell
        cell.pictureImage.image = UIImage(named: "HaiTun_0\(indexPath.row)")
        
        if indexPath.item >= 3{
            let isScusessPay = defalt.objectForKey(productAttay[indexPath.item - 3]) as? String
            print(isScusessPay)
            if isScusessPay == productAttay[indexPath.item - 3]{
                cell.lockImage.image = nil
             }else{
                cell.lockImage.image = UIImage(named: "lock")
             }
         }else{
            cell.lockImage.image = nil
         }
        
        return cell
    }
    
    //定义每个UICollectionView 的大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let collectionViewWH = CGFloat(Int((MyScreenWith - 40) / 3))
        return CGSizeMake(collectionViewWH, collectionViewWH)
    }
    
    //定义每个UICollectionView 纵向的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 10
    }
    
    //定义每个UICollectionView 横向的间距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.item >= 3{ // 点击item为3时添加内购
            let isScusessPay = defalt.objectForKey(productAttay[indexPath.item - 3]) as? String
             if isScusessPay == productAttay[indexPath.item - 3]{
                navigationController?.popViewControllerAnimated(true)
                if let imageBlocks = imageBlock {
                    imageBlocks(name: imageArray[indexPath.row]!)
                }
            }else{
                
                isParentOnly(indexPath.item)
            }
            
        }else{
            navigationController?.popViewControllerAnimated(true)
            if let imageBlocks = imageBlock {
                imageBlocks(name: imageArray[indexPath.row]!)
            }
        }
    }
    
    // 判断只有父母可以用
    func isParentOnly(items:Int){
        let parentPFClickView = SLBOnlyParentAlterTool()
        parentPFClickView.frame = view.bounds
        view.addSubview(parentPFClickView)
        
        parentPFClickView.parentOnly = {isParent in
            if isParent == true{ // 如果正确
                
                if items >= 3{
                    
                    // 开始转菊花
                    self.ldHUD = LDHud()
                    self.ldHUD.frame = self.view.bounds
                    self.view.addSubview(self.ldHUD)
                    
                 InAppPurchaseTool.sharedInstance.drawBackgroundInAppPurchaseProduct(items - 3)
                }else{
                InAppPurchaseTool.sharedInstance.restoreTransactions()
                 }
             }
        }
    }
    
    func showAlertWithMessage(message:String){
        let alert = UIAlertView(title: NSLocalizedString("tip", comment: ""), message: message, delegate: nil, cancelButtonTitle: NSLocalizedString("commitStr", comment: ""))
        alert.show()
    }
    
}
