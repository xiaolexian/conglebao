

//
//  SLBPauseAlertView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/1.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

@objc protocol SLBPauseAlertViewDelegate {
    @objc optional func didClickContinueAndGiveUpClickButton( didClickContinueAndGiveUpButton button: UIButton)
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
        bgView.isUserInteractionEnabled = true
        bgView.image = UIImage(named: "playAlert_BG")
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        bgView.layer.borderWidth = 2
        bgView.layer.borderColor = UIColor.green.cgColor
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
        
        // 继续按钮
        continueBtn = UIButton()
        continueBtn.frame = CGRectMakeWithCenter (bgView.width * 0.5 , 100, 100, 45)
        continueBtn.tag = 10
         continueBtn.setTitle(NSLocalizedString("continueStr", comment: ""), for: UIControlState())
        continueBtn.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
        continueBtn.addTarget(self, action: #selector(SLBPauseAlertView.continueAndGiveUpClick(_:)), for: .touchUpInside)
        continueBtn.setTitleShadowColor(UIColor.black, for: UIControlState())
        continueBtn.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 2.0)
        bgView.addSubview(continueBtn)
        
        // 放弃按钮
        giveUpBtn = UIButton()
        giveUpBtn.frame = CGRectMakeWithCenter (bgView.width * 0.5 , continueBtn.maxY + 40, 100, 45)
        giveUpBtn.tag = 20
        giveUpBtn.setTitleShadowColor(UIColor.black, for: UIControlState())
        giveUpBtn.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 2.0)
        giveUpBtn.setBackgroundImage(UIImage(named: "giveUp_icon"), for: UIControlState())
          giveUpBtn.setTitle(NSLocalizedString("giveUpStr", comment: ""), for: UIControlState())
        giveUpBtn.addTarget(self, action: #selector(SLBPauseAlertView.continueAndGiveUpClick(_:)), for: .touchUpInside)
         bgView.addSubview(giveUpBtn)
        
        questionsLabel = UILabel()
        questionsLabel.shadowColor = UIColor.black
        questionsLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        questionsLabel.font = UIFont.systemFont(ofSize: 40)
        questionsLabel.textColor = UIColor.white
        questionsLabel.textAlignment = .center
         questionsLabel.frame = CGRectMakeWithCenter(bgView.width * 0.5, 40, bgView.width, 50)
        questionsLabel.textAlignment = .center
        bgView.addSubview(questionsLabel)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func continueAndGiveUpClick(_ sender: UIButton){
        removeFromSuperview()
        delegate?.didClickContinueAndGiveUpClickButton!(didClickContinueAndGiveUpButton: sender)
    }
    
 
}
