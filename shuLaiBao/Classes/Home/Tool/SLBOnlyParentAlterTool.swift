//
//  SLBOnlyParentAlterTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/26.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBOnlyParentAlterTool: UIView {
    private let bgView = UIImageView()
    private let myLabel = UILabel()
    private let titleLabel = UILabel()
    
    private let directWord = [UISwipeGestureRecognizerDirection.Up, UISwipeGestureRecognizerDirection.Down, UISwipeGestureRecognizerDirection.Left, UISwipeGestureRecognizerDirection.Right]
    private let word = [NSLocalizedString("upStr", comment: ""), NSLocalizedString("downStr", comment: ""),NSLocalizedString("leftStr", comment: ""), NSLocalizedString("rightStr", comment: "")]
    var myImage = UIImageView()
    
    //声明一个block
    typealias isParent = (Bool)->Void
    var parentOnly:isParent!
    
    private let randomWord = myRandom(0, max: 3)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        // 背景View
        bgView.frame = CGRectMakeWithCenter(myScreenSize.width / 2, myScreenSize.height / 2, MyScreenWith - 40, MyScreenWith - 40)
        bgView.userInteractionEnabled = true
        bgView.image = UIImage(named: "alterPartant")
        addSubview(bgView)
        
        // 背景View的弹出动画
        let popAnimation = CAKeyframeAnimation(keyPath: "transform")
        popAnimation.duration = 0.4
        popAnimation.values = [ NSValue(CATransform3D: CATransform3DMakeScale(0.01, 0.01, 0.01)),
            NSValue(CATransform3D: CATransform3DMakeScale(1.1, 1.1, 1.1)),
            NSValue(CATransform3D: CATransform3DMakeScale(0.9, 0.9, 0.9)),
            NSValue(CATransform3D: CATransform3DIdentity)]
        popAnimation.keyTimes = [0.2, 0.5, 0.75, 1.0]
        popAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        bgView.layer.addAnimation(popAnimation, forKey: nil)
        
        // 请用两指手指滑动
        myLabel.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height * 0.8, bgView.width, 25)
        let plasetwofingers = NSLocalizedString("pleaseTwoFinger", comment: "")
        let swichStr = NSLocalizedString("swipeStr", comment: "")
        myLabel.text = "\(plasetwofingers) \(word[randomWord]) \(swichStr)"
        myLabel.textColor = UIColor.whiteColor()
        myLabel.textAlignment = .Center
        myLabel.shadowColor = UIColor.blackColor()
        myLabel.shadowOffset = CGSizeMake(1.0, 1.0)
        myLabel.font = UIFont.systemFontOfSize(16)
        bgView.addSubview(myLabel)
        
        // 请用两指手指滑动
        titleLabel.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height * 0.15, bgView.width, 30)
        titleLabel.text = NSLocalizedString("parentStr", comment: "")
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.shadowColor = UIColor.blackColor()
        titleLabel.shadowOffset = CGSizeMake(1.0, 1.0)
        titleLabel.font = UIFont.boldSystemFontOfSize(30)
        bgView.addSubview(titleLabel)
        
        // 猴子图像
        myImage.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height / 2, 100, 100)
        myImage.userInteractionEnabled = true
        myImage.image = UIImage(named: "monkey")
        bgView.addSubview(myImage)
        
        // 轻扫手势
        for allIndext in 1..<6{
            for index in 0..<4 {
                let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(SLBOnlyParentAlterTool.twoSwipe(_:)))
                upSwipe.direction = directWord[index]
                upSwipe.numberOfTouchesRequired = allIndext
                addGestureRecognizer(upSwipe)
            }
        }
        
        // 轻击手势
        for tapIndex in 1..<6{
            let tap = UITapGestureRecognizer(target: self, action: #selector(SLBOnlyParentAlterTool.tapClick))
            tap.numberOfTouchesRequired = tapIndex
            addGestureRecognizer(tap)
        }
        
        // 长按手势
        for longIndex in 1..<6{
            let long = UILongPressGestureRecognizer(target: self, action: #selector(SLBOnlyParentAlterTool.longClick(_:)))
            long.numberOfTouchesRequired = longIndex
            addGestureRecognizer(long)
        }
        
        // 捏合手势
        //        let pin = UIPinchGestureRecognizer(target: self, action: "pinClick")
        //        addGestureRecognizer(pin)
        
        
    }
    
    func pinClick() {
        removeFromSuperview()
    }
    
    func tapClick(){
        removeFromSuperview()
    }
    
    func longClick(sender:UILongPressGestureRecognizer){
        if sender.state == .Ended{
            removeFromSuperview()
        }
        
        if sender.state == .Changed{
            
            print(sender.locationInView(self))
        }
    }
    
    
    func twoSwipe(sender:UISwipeGestureRecognizer){
        
        if sender.numberOfTouchesRequired == 2 && sender.direction == directWord[randomWord] {// 操作正确
            print("操作正确")
            parentOnly(true)
            removeFromSuperview()
        }else{
            removeFromSuperview()
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
