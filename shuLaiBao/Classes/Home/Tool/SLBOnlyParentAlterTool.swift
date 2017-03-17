//
//  SLBOnlyParentAlterTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/26.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBOnlyParentAlterTool: UIView {
    fileprivate let bgView = UIImageView()
    fileprivate let myLabel = UILabel()
    fileprivate let titleLabel = UILabel()
    
    fileprivate let directWord = [UISwipeGestureRecognizerDirection.up, UISwipeGestureRecognizerDirection.down, UISwipeGestureRecognizerDirection.left, UISwipeGestureRecognizerDirection.right]
    fileprivate let word = [NSLocalizedString("upStr", comment: ""), NSLocalizedString("downStr", comment: ""),NSLocalizedString("leftStr", comment: ""), NSLocalizedString("rightStr", comment: "")]
    var myImage = UIImageView()
    
    //声明一个block
    typealias isParent = (Bool)->Void
    var parentOnly:isParent!
    
    fileprivate let randomWord = myRandom(0, max: 3)
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        // 背景View
        bgView.frame = CGRectMakeWithCenter(myScreenSize.width / 2, myScreenSize.height / 2, MyScreenWith - 40, MyScreenWith - 40)
        bgView.isUserInteractionEnabled = true
        bgView.image = UIImage(named: "alterPartant")
        addSubview(bgView)
        
        // 背景View的弹出动画
        let popAnimation = CAKeyframeAnimation(keyPath: "transform")
        popAnimation.duration = 0.4
        popAnimation.values = [ NSValue(caTransform3D: CATransform3DMakeScale(0.01, 0.01, 0.01)),
            NSValue(caTransform3D: CATransform3DMakeScale(1.1, 1.1, 1.1)),
            NSValue(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 0.9)),
            NSValue(caTransform3D: CATransform3DIdentity)]
        popAnimation.keyTimes = [0.2, 0.5, 0.75, 1.0]
        popAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        bgView.layer.add(popAnimation, forKey: nil)
        
        // 请用两指手指滑动
        myLabel.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height * 0.8, bgView.width, 25)
        let plasetwofingers = NSLocalizedString("pleaseTwoFinger", comment: "")
        let swichStr = NSLocalizedString("swipeStr", comment: "")
        myLabel.text = "\(plasetwofingers) \(word[randomWord]) \(swichStr)"
        myLabel.textColor = UIColor.white
        myLabel.textAlignment = .center
        myLabel.shadowColor = UIColor.black
        myLabel.shadowOffset = CGSize(width: 1.0, height: 1.0)
        myLabel.font = UIFont.systemFont(ofSize: 16)
        bgView.addSubview(myLabel)
        
        // 请用两指手指滑动
        titleLabel.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height * 0.15, bgView.width, 30)
        titleLabel.text = NSLocalizedString("parentStr", comment: "")
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.shadowColor = UIColor.black
        titleLabel.shadowOffset = CGSize(width: 1.0, height: 1.0)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        bgView.addSubview(titleLabel)
        
        // 猴子图像
        myImage.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height / 2, 100, 100)
        myImage.isUserInteractionEnabled = true
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
    
    func longClick(_ sender:UILongPressGestureRecognizer){
        if sender.state == .ended{
            removeFromSuperview()
        }
        
        if sender.state == .changed{
            
            print(sender.location(in: self))
        }
    }
    
    
    func twoSwipe(_ sender:UISwipeGestureRecognizer){
        
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
