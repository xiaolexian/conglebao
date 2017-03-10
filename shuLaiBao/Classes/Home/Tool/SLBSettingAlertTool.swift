//
//  SLBSettingAlertTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/23.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBSettingAlertTool: UIView {
    private let bgView = UIImageView()
    var deleteBtn = UIButton()
    let iconImageView = UIImageView()
    let versionLabel = UILabel()
    var pingFenBtn = UIButton()
    let contentLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        // 背景View
        bgView.frame = CGRectMakeWithCenter(myScreenSize.width / 2, myScreenSize.height / 2, MyScreenWith - 40, MyScreenHeight - 40)
        bgView.userInteractionEnabled = true
        bgView.image = UIImage(named: "setting_BG")
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
        
        
        // 图标ImageView
        iconImageView.frame = CGRectMakeWithCenter(bgView.width * 0.5, 10 + 50, 60, 60)
         iconImageView.image = UIImage(named: "congLeBao")
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.masksToBounds = true
         bgView.addSubview(iconImageView)
        
        // 版本Label
        versionLabel.frame = CGRectMake(0, iconImageView.maxY + 10, bgView.width, 20)
        versionLabel.textColor = UIColor.whiteColor()
        versionLabel.shadowColor = UIColor.blackColor()
        versionLabel.shadowOffset = CGSizeMake(1.0, 1.0)
         let key = String(kCFBundleVersionKey)
        let md = NSBundle.mainBundle().infoDictionary
        let currentVersion = md![key]!
        versionLabel.text = "\(NSLocalizedString("smartBabyStr", comment: "")) \(currentVersion)"
        versionLabel.font = UIFont.boldSystemFontOfSize(15)
        versionLabel.textAlignment = .Center
        bgView.addSubview(versionLabel)
        
        // 文字label
        contentLabel.frame = CGRectMake(25, versionLabel.maxY + 10 , bgView.width - 50, 150)
        contentLabel.text = NSLocalizedString("aboutSmartBaby", comment: "")
        contentLabel.font = UIFont.boldSystemFontOfSize(12)
        contentLabel.textColor = UIColor.whiteColor()
        contentLabel.shadowColor = UIColor.blackColor()
        contentLabel.shadowOffset = CGSizeMake(1.0, 1.0)
         contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .ByWordWrapping
        bgView.addSubview(contentLabel)
        
        pingFenBtn.frame = CGRectMake(0, contentLabel.maxY + 20, 120, 45)
        pingFenBtn.centerX = bgView.width / 2
        pingFenBtn.setBackgroundImage(UIImage(named: "commitBtn_icon"), forState: .Normal)
        pingFenBtn.setTitle(NSLocalizedString("praiseStr", comment: ""), forState: .Normal)
        pingFenBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
         bgView.addSubview(pingFenBtn)

        
        // 删除视图按钮
        deleteBtn.frame = CGRectMake(bgView.width - 30 - 30, bgView.y + 5, 30, 30)
        deleteBtn.setBackgroundImage(UIImage(named: "delete_but"), forState: .Normal)
        deleteBtn.addTarget(self, action: #selector(SLBSettingAlertTool.deleteBtnClick), forControlEvents: .TouchUpInside)
        bgView.addSubview(deleteBtn)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  
    func deleteBtnClick(){
        removeFromSuperview()
    }
    
}
