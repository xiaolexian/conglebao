//
//  LDHud.swift
//  shuLaiBao
//
//  Created by liudeng on 16/3/10.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class LDHud: UIView {
    var circleView:UIView!
    var caiDie:UIImageView!
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        // 添加圆形
        circleView = UIView()
        circleView.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.5, 80, 80)
        circleView.layer.cornerRadius = 40
        circleView.layer.masksToBounds = true
        circleView.backgroundColor = UIColor.blackColor()
        circleView.alpha = 0.3
        addSubview(circleView)
        
        caiDie = UIImageView()
        caiDie.userInteractionEnabled = true
        let caiDieW:CGFloat = 100
        caiDie.frame = CGRectMakeWithCenter(MyScreenWith * 0.48, MyScreenHeight * 0.49, caiDieW, caiDieW)
         addSubview(caiDie)
        imageAnimation("CaiDie_0", imageNumber: 10, RepeatCount: 0, imageViews: caiDie, duration: 0.04)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK:- 序列动画
    func imageAnimation(imageName:String, imageNumber: Int, RepeatCount: Int, imageViews:UIImageView, duration: CGFloat){
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
    
    func hide(){
        caiDie.stopAnimating()
        caiDie = nil
        removeFromSuperview()
    }
    
    func stopAnimat(){
        caiDie.stopAnimating()
    }

    func starAnimat(){
        caiDie.startAnimating()
    }
}
