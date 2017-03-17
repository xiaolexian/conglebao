//
//  MyPopView.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/19.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

@objc protocol MyPopViewDelegate {
    @objc optional func myPopView(_ popview: MyPopView, contentText: String, resultNum: Int)
}

class MyPopView: UIView, UIScrollViewDelegate {
    fileprivate let bgView = UIImageView()
    fileprivate var firstNum: Int!
    fileprivate var secondNum: Int!
    fileprivate var resultNum: Int!
    fileprivate var contentText: String!
     var contentLabel:UILabel!
    
    var delegate: MyPopViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.8)
        
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
        
        // 题目Label
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMakeWithCenter(bgView.width / 2, 30, bgView.width , 20)
        titleLabel.text = NSLocalizedString("questionStr", comment: "")
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        titleLabel.shadowColor = UIColor.black
        bgView.addSubview(titleLabel)
        
        // 内容Label
        contentLabel = UILabel()
        contentLabel.frame = CGRectMakeWithCenter(bgView.width / 2, titleLabel.maxY + 50, bgView.width, 80)

        contentLabel.font = UIFont.systemFont(ofSize: 65)
        contentLabel.textColor = UIColor.white
        contentLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        contentLabel.shadowColor = UIColor.black
        contentLabel.textAlignment = .center
        bgView.addSubview(contentLabel)
        
        // 确定按钮Button
        let okButton = UIButton()
        okButton.frame = CGRectMakeWithCenter(bgView.width / 2, contentLabel.maxY + 10 + 20, 100, 40)
         okButton.setTitle(NSLocalizedString("startStr", comment: ""), for: UIControlState())
        okButton.setTitleShadowColor(UIColor.black, for: UIControlState())
        okButton.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 2.0)
        okButton.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
         okButton.addTarget(self, action: #selector(MyPopView.okButtonClick), for: .touchUpInside)
        bgView.addSubview(okButton)
    }
    
    // MARK: - 按钮点击事件
    func okButtonClick() {
        delegate?.myPopView?(self, contentText: contentText, resultNum: resultNum)
        removeFromSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 计算关卡数字(例如初级为10,中级15,高级20以内)
    func numbers(_ num:Int) {
        while true {
            firstNum = myRandom(1, max: num)
            secondNum = myRandom(1, max: num)
            if Int(arc4random()) % 2 == 1 {
                resultNum = firstNum + secondNum
                if resultNum < num {
                    contentText = "\(firstNum!)+\(secondNum!)=?"
                    break
                }
            } else {
                if firstNum < secondNum {
                    let temp = firstNum
                    firstNum = secondNum
                    secondNum = temp
                }
                resultNum = firstNum - secondNum
                contentText = "\(firstNum!)-\(secondNum!)=?"
                break
            }
        }
        contentLabel.text = contentText
    }
    
}
