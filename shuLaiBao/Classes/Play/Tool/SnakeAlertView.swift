//
//  SnakeAlertView.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/20.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

@objc protocol SnakeAlertViewDelegate {
    optional func snakeAlertView(alertView: SnakeAlertView, didClickOkButton button: UIButton)
    optional func snakeAlertView(alertView: SnakeAlertView, didClickRestartButton button: UIButton)
    optional func snakeAlertView(alertView: SnakeAlertView, didClickBackButton button: UIButton)
}

class SnakeAlertView: UIView {
    var delegate: SnakeAlertViewDelegate?
    private let bgView = UIImageView()
    private let contentLabel = UILabel()
    private let okButton = UIButton()
    private let restartButton = UIButton()
    private let backButton = UIButton()
    private var firstNum: Int!
    private var secondNum: Int!
    private var resultNum: Int!
    var contentText: String? {
        willSet {
            contentLabel.text = newValue
        }
    }
    var isGameWin: Bool? {
        willSet {
            if newValue == true {
                okButton.hidden = true
                restartButton.hidden = false
                backButton.hidden = false
            } else {
                okButton.hidden = false
                restartButton.hidden = true
                backButton.hidden = true
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        // 背景View
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
        
        // 内容Label
        contentLabel.frame = CGRectMakeWithCenter(bgView.width / 2, 80, bgView.width, 70)
        contentLabel.shadowColor = UIColor.blackColor()
        contentLabel.shadowOffset = CGSizeMake(1.0, 2.0)
        contentLabel.font = UIFont.systemFontOfSize(20)
        contentLabel.textColor = UIColor.whiteColor()
        contentLabel.textAlignment = .Center
        contentLabel.numberOfLines = 0
        bgView.addSubview(contentLabel)
        
        // 确定按钮Button
        okButton.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height - 30 - 20, 100, 40)
        okButton.setTitle(NSLocalizedString("nextQuestion", comment: ""), forState: .Normal)
        okButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        okButton.titleLabel?.shadowOffset = CGSizeMake(1.0, 2.0)
        okButton.setBackgroundImage(UIImage(named: "commitBtn_icon"), forState: .Normal)
        okButton.addTarget(self, action: #selector(SnakeAlertView.okButtonClick(_:)), forControlEvents: .TouchUpInside)
        bgView.addSubview(okButton)
        
        restartButton.frame = CGRectMakeWithCenter(bgView.width / 4, okButton.centerY, 100, 40)
        restartButton.hidden = true
        restartButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        restartButton.titleLabel?.shadowOffset = CGSizeMake(1.0, 2.0)
        restartButton.setTitle(NSLocalizedString("againGameStr", comment: ""), forState: .Normal)
        restartButton.setBackgroundImage(UIImage(named: "commitBtn_icon"), forState: .Normal)
        restartButton.addTarget(self, action: #selector(SnakeAlertView.restartButtonClick(_:)), forControlEvents: .TouchUpInside)
        bgView.addSubview(restartButton)
        
        backButton.frame = CGRectMakeWithCenter(bgView.width * 3 / 4, okButton.centerY, 100, 40)
        backButton.hidden = true
        backButton.setBackgroundImage(UIImage(named: "giveUp_icon"), forState: .Normal)
        backButton.setTitle(NSLocalizedString("backStr", comment: "备注"), forState: .Normal)
        backButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        backButton.titleLabel?.shadowOffset = CGSizeMake(1.0, 2.0)
        backButton.addTarget(self, action: #selector(SnakeAlertView.backButtonClick(_:)), forControlEvents: .TouchUpInside)
        bgView.addSubview(backButton)
    }
    
    convenience init(contentText: String) {
        self.init(frame: CGRectZero)
        self.contentText = contentText
        self.contentLabel.text = contentText
    }
    
    // MARK: - 按钮点击事件
    func okButtonClick(sender: UIButton) {
        removeFromSuperview()
        delegate?.snakeAlertView?(self, didClickOkButton: sender)
    }
    
    func restartButtonClick(sender: UIButton) {
        removeFromSuperview()
        delegate?.snakeAlertView?(self, didClickRestartButton: sender)
    }
    
    func backButtonClick(sender: UIButton) {
        removeFromSuperview()
        delegate?.snakeAlertView?(self, didClickBackButton: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
