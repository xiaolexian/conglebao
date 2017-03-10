

//
//  SLBPauseAlertView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/1.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

@objc protocol SLBPauseAlertViewDelegate {
    optional func didClickContinueAndGiveUpClickButton( didClickContinueAndGiveUpButton button: UIButton)
 }

class SLBPauseAlertView: UIView {
    var delegate:SLBPauseAlertViewDelegate?
    var bgView:UIImageView!
    var continueBtn:UIButton!
    var giveUpBtn:UIButton!
    var questionsLabel:UILabel!
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0, alpha: 0.8)
        
        //背景View
        bgView = UIImageView()
        bgView.frame = CGRectMakeWithCenter(myScreenSize.width / 2, myScreenSize.height / 2, myScreenSize.width - 50, 200)
        bgView.userInteractionEnabled = true
        bgView.image = UIImage(named: "playAlert_BG")
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        bgView.layer.borderWidth = 2
        bgView.layer.borderColor = UIColor.greenColor().CGColor
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
        
        // 继续按钮
        continueBtn = UIButton()
        continueBtn.frame = CGRectMakeWithCenter (bgView.width * 0.5 , 100, 100, 45)
        continueBtn.tag = 10
         continueBtn.setTitle(NSLocalizedString("continueStr", comment: ""), forState: .Normal)
        continueBtn.setBackgroundImage(UIImage(named: "commitBtn_icon"), forState: .Normal)
        continueBtn.addTarget(self, action: #selector(SLBPauseAlertView.continueAndGiveUpClick(_:)), forControlEvents: .TouchUpInside)
        continueBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        continueBtn.titleLabel?.shadowOffset = CGSizeMake(1.0, 2.0)
        bgView.addSubview(continueBtn)
        
        // 放弃按钮
        giveUpBtn = UIButton()
        giveUpBtn.frame = CGRectMakeWithCenter (bgView.width * 0.5 , continueBtn.maxY + 40, 100, 45)
        giveUpBtn.tag = 20
        giveUpBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        giveUpBtn.titleLabel?.shadowOffset = CGSizeMake(1.0, 2.0)
        giveUpBtn.setBackgroundImage(UIImage(named: "giveUp_icon"), forState: .Normal)
          giveUpBtn.setTitle(NSLocalizedString("giveUpStr", comment: ""), forState: .Normal)
        giveUpBtn.addTarget(self, action: #selector(SLBPauseAlertView.continueAndGiveUpClick(_:)), forControlEvents: .TouchUpInside)
         bgView.addSubview(giveUpBtn)
        
        questionsLabel = UILabel()
        questionsLabel.shadowColor = UIColor.blackColor()
        questionsLabel.shadowOffset = CGSizeMake(1.0, 2.0)
        questionsLabel.font = UIFont.systemFontOfSize(40)
        questionsLabel.textColor = UIColor.whiteColor()
        questionsLabel.textAlignment = .Center
         questionsLabel.frame = CGRectMakeWithCenter(bgView.width * 0.5, 40, bgView.width, 50)
        questionsLabel.textAlignment = .Center
        bgView.addSubview(questionsLabel)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func continueAndGiveUpClick(sender: UIButton){
        removeFromSuperview()
        delegate?.didClickContinueAndGiveUpClickButton!(didClickContinueAndGiveUpButton: sender)
    }
    
 
}
