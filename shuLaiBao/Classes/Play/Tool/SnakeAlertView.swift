//
//  SnakeAlertView.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/20.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

@objc protocol SnakeAlertViewDelegate {
    @objc optional func snakeAlertView(_ alertView: SnakeAlertView, didClickOkButton button: UIButton)
    @objc optional func snakeAlertView(_ alertView: SnakeAlertView, didClickRestartButton button: UIButton)
    @objc optional func snakeAlertView(_ alertView: SnakeAlertView, didClickBackButton button: UIButton)
}

class SnakeAlertView: UIView {
    var delegate: SnakeAlertViewDelegate?
    fileprivate let bgView = UIImageView()
    fileprivate let contentLabel = UILabel()
    fileprivate let okButton = UIButton()
    fileprivate let restartButton = UIButton()
    fileprivate let backButton = UIButton()
    fileprivate var firstNum: Int!
    fileprivate var secondNum: Int!
    fileprivate var resultNum: Int!
    var contentText: String? {
        willSet {
            contentLabel.text = newValue
        }
    }
    var isGameWin: Bool? {
        willSet {
            if newValue == true {
                okButton.isHidden = true
                restartButton.isHidden = false
                backButton.isHidden = false
            } else {
                okButton.isHidden = false
                restartButton.isHidden = true
                backButton.isHidden = true
            }
        }
    }
    
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
        
        // 内容Label
        contentLabel.frame = CGRectMakeWithCenter(bgView.width / 2, 80, bgView.width, 70)
        contentLabel.shadowColor = UIColor.black
        contentLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        contentLabel.font = UIFont.systemFont(ofSize: 20)
        contentLabel.textColor = UIColor.white
        contentLabel.textAlignment = .center
        contentLabel.numberOfLines = 0
        bgView.addSubview(contentLabel)
        
        // 确定按钮Button
        okButton.frame = CGRectMakeWithCenter(bgView.width / 2, bgView.height - 30 - 20, 100, 40)
        okButton.setTitle(NSLocalizedString("nextQuestion", comment: ""), for: UIControlState())
        okButton.setTitleShadowColor(UIColor.black, for: UIControlState())
        okButton.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 2.0)
        okButton.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
        okButton.addTarget(self, action: #selector(SnakeAlertView.okButtonClick(_:)), for: .touchUpInside)
        bgView.addSubview(okButton)
        
        restartButton.frame = CGRectMakeWithCenter(bgView.width / 4, okButton.centerY, 100, 40)
        restartButton.isHidden = true
        restartButton.setTitleShadowColor(UIColor.black, for: UIControlState())
        restartButton.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 2.0)
        restartButton.setTitle(NSLocalizedString("againGameStr", comment: ""), for: UIControlState())
        restartButton.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
        restartButton.addTarget(self, action: #selector(SnakeAlertView.restartButtonClick(_:)), for: .touchUpInside)
        bgView.addSubview(restartButton)
        
        backButton.frame = CGRectMakeWithCenter(bgView.width * 3 / 4, okButton.centerY, 100, 40)
        backButton.isHidden = true
        backButton.setBackgroundImage(UIImage(named: "giveUp_icon"), for: UIControlState())
        backButton.setTitle(NSLocalizedString("backStr", comment: "备注"), for: UIControlState())
        backButton.setTitleShadowColor(UIColor.black, for: UIControlState())
        backButton.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 2.0)
        backButton.addTarget(self, action: #selector(SnakeAlertView.backButtonClick(_:)), for: .touchUpInside)
        bgView.addSubview(backButton)
    }
    
    convenience init(contentText: String) {
        self.init(frame: CGRect.zero)
        self.contentText = contentText
        self.contentLabel.text = contentText
    }
    
    // MARK: - 按钮点击事件
    func okButtonClick(_ sender: UIButton) {
        removeFromSuperview()
        delegate?.snakeAlertView?(self, didClickOkButton: sender)
    }
    
    func restartButtonClick(_ sender: UIButton) {
        removeFromSuperview()
        delegate?.snakeAlertView?(self, didClickRestartButton: sender)
    }
    
    func backButtonClick(_ sender: UIButton) {
        removeFromSuperview()
        delegate?.snakeAlertView?(self, didClickBackButton: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
