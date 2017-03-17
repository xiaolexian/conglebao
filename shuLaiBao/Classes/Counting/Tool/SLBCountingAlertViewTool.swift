//
//  SLBCountingAlertViewTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/20.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

@objc protocol SLBCountingDelegate{
    @objc optional func sLBCountingAlerViewClick()
}

class SLBCountingAlertViewTool: UIView {
    var delegate:SLBCountingDelegate?
    var nextBut:UIButton!

    fileprivate let bgView = UIImageView()
    var tipLabel:UILabel!
    var tryAgain:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        // 背景View
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
        
        tipLabel = UILabel()
        tipLabel.frame = CGRectMakeWithCenter(bgView.width * 0.5, bgView.height * 0.3, bgView.width, 30)
        tipLabel.text = NSLocalizedString("congratulationStr", comment: "")
        tipLabel.font = UIFont(name: "STHupo", size: 18)
        tipLabel.textAlignment = .center
        tipLabel.shadowColor = UIColor.black
        tipLabel.shadowOffset = CGSize(width: 1.0, height: 1.0)
        tipLabel.textColor = UIColor.white
        bgView.addSubview(tipLabel)
        
        nextBut = UIButton()
        nextBut.frame = CGRectMakeWithCenter(bgView.width * 0.5, bgView.height * 0.7, 100, 40)
        nextBut.addTarget(self, action: #selector(SLBCountingAlertViewTool.nextBtnClick), for: .touchUpInside)
        nextBut.setTitle(NSLocalizedString("countAgainGameStr", comment: ""), for: UIControlState())
        nextBut.setTitleShadowColor(UIColor.black, for: UIControlState())
        nextBut.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 1.0)
        nextBut.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
        nextBut.titleLabel?.font = UIFont(name: "STHupo", size: 16)
        bgView.addSubview(nextBut)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func nextBtnClick(){
        removeFromSuperview()
        delegate?.sLBCountingAlerViewClick!()
    }
    
}
