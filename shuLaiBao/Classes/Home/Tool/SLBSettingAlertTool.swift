//
//  SLBSettingAlertTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/23.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBSettingAlertTool: UIView {
    fileprivate let bgView = UIImageView()
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
        bgView.isUserInteractionEnabled = true
        bgView.image = UIImage(named: "setting_BG")
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
        
        
        // 图标ImageView
        iconImageView.frame = CGRectMakeWithCenter(bgView.width * 0.5, 10 + 50, 60, 60)
         iconImageView.image = UIImage(named: "congLeBao")
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.masksToBounds = true
         bgView.addSubview(iconImageView)
        
        // 版本Label
        versionLabel.frame = CGRect(x: 0, y: iconImageView.maxY + 10, width: bgView.width, height: 20)
        versionLabel.textColor = UIColor.white
        versionLabel.shadowColor = UIColor.black
        versionLabel.shadowOffset = CGSize(width: 1.0, height: 1.0)
         let key = String(kCFBundleVersionKey)
        let md = Bundle.main.infoDictionary
        let currentVersion = md![key]!
        versionLabel.text = "\(NSLocalizedString("smartBabyStr", comment: "")) \(currentVersion)"
        versionLabel.font = UIFont.boldSystemFont(ofSize: 15)
        versionLabel.textAlignment = .center
        bgView.addSubview(versionLabel)
        
        // 文字label
        contentLabel.frame = CGRect(x: 25, y: versionLabel.maxY + 10 , width: bgView.width - 50, height: 150)
        contentLabel.text = NSLocalizedString("aboutSmartBaby", comment: "")
        contentLabel.font = UIFont.boldSystemFont(ofSize: 12)
        contentLabel.textColor = UIColor.white
        contentLabel.shadowColor = UIColor.black
        contentLabel.shadowOffset = CGSize(width: 1.0, height: 1.0)
         contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        bgView.addSubview(contentLabel)
        
        pingFenBtn.frame = CGRect(x: 0, y: contentLabel.maxY + 20, width: 120, height: 45)
        pingFenBtn.centerX = bgView.width / 2
        pingFenBtn.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
        pingFenBtn.setTitle(NSLocalizedString("praiseStr", comment: ""), for: UIControlState())
        pingFenBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
         bgView.addSubview(pingFenBtn)

        
        // 删除视图按钮
        deleteBtn.frame = CGRect(x: bgView.width - 30 - 30, y: bgView.y + 5, width: 30, height: 30)
        deleteBtn.setBackgroundImage(UIImage(named: "delete_but"), for: UIControlState())
        deleteBtn.addTarget(self, action: #selector(SLBSettingAlertTool.deleteBtnClick), for: .touchUpInside)
        bgView.addSubview(deleteBtn)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  
    func deleteBtnClick(){
        removeFromSuperview()
    }
    
}
