//
//  SLBCountingViewController.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/15.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBCountingViewController: UIViewController,SLBCountingDelegate {
    var countingV:SLBCountingView!
    var btnCenterDic = [UIView : CGPoint]()
    var basketCurrentCoutn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化视图
        setupView()
    }
    
    // 初始化视图
    func setupView(){
        basketCurrentCoutn = 0
        countingV = SLBCountingView(frame: view.bounds)
        view.addSubview(countingV)
        countingV.backButton.addTarget(self, action: #selector(SLBCountingViewController.backButtonClick), for: .touchUpInside)
        imageAnimation("redFox_0", imageNumber: 8, RepeatCount: 0, imageViews: countingV.redFoxImage, duration: 0.2)
        countingV.commitButton.addTarget(self, action: #selector(SLBCountingViewController.commitClick), for: .touchUpInside)
        for name in countingV.grapeBtnArray {
            name.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(SLBCountingViewController.grapeImagePan(_:))))
        }
    }
    
    // MARK:- 点击确定按钮
    func commitClick(){
        
        let alerView = SLBCountingAlertViewTool()
        alerView.frame = view.bounds
        alerView.delegate = self
        view.addSubview(alerView)
        
        if (basketCurrentCoutn == countingV.randomCount){
            alerView.tipLabel.text = NSLocalizedString("congratulationStr", comment: "")
        }else{
            alerView.tipLabel.text = NSLocalizedString("sorryFalil", comment: "")
        }
        
    }
    
    // MARK:- 退出按钮
    func backButtonClick(){
        navigationController!.popViewController(animated: true)
    }
    
    // MARK:- 葡萄拖动事件
    func grapeImagePan(_ sender: UIPanGestureRecognizer){
        
        // 判断是否葡萄放进篮子里面
        let isContainsPoint:Bool = countingV.basket.frame.contains((sender.view?.center)!)
        
        switch sender.state{
        case .began:
            btnCenterDic[sender.view!] = sender.view!.center
        case .changed:
            sender.view!.center = sender.location(in: self.view)
            countingV.lightBasket.isHidden = !isContainsPoint
        case .ended:
            
            // 高亮的篮子隐藏
            countingV.lightBasket.isHidden = true
            
            if isContainsPoint{
                
                // 1.如果将葡萄拖进框内移除葡萄
                sender.view?.removeFromSuperview()
                
                // 2.添加葡萄到篮子的个数
                addCurrentBasketCount()
                
            }else{  // 如果没有葡萄就返回
                
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveLinear, animations: { () -> Void in
                    sender.view!.center = self.btnCenterDic[sender.view!]!
                    }, completion: nil)
            }
        default:
            break
        }
    }
    
    // MARK:- 弹框代理方法
    func sLBCountingAlerViewClick() {
        print("ff")
        setupView()
        
    }
    
    func addCurrentBasketCount(){
        basketCurrentCoutn += 1
        
        // 改变篮子里面葡萄的个数
        countingV.basket.image = UIImage(named: "basket_\(basketCurrentCoutn)")
        
        // 改变确定按钮的数字
        let commitStr = NSLocalizedString("commitStr", comment: "")
        countingV.commitButton.setTitle("(\(basketCurrentCoutn))\(commitStr)", for: UIControlState())
        
    }
    
    //    MARK:- 序列动画
    func imageAnimation(_ imageName:String, imageNumber: Int, RepeatCount: Int, imageViews:UIImageView, duration: CGFloat){
        var imagArray = [UIImage]()
        for indext in 0..<imageNumber{
            let imageStr = String(format: "\(imageName)%d",indext)
            let images = UIImage(named: imageStr)
            imagArray.append(images!)
        }
        imageViews.animationImages = imagArray
        imageViews.animationRepeatCount = RepeatCount
        imageViews.animationDuration = Double(CGFloat(imageNumber) * duration)
        imageViews.startAnimating()
    }
}
