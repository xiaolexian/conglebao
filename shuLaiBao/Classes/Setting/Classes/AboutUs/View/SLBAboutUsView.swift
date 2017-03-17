//
//  SLBAboutUsView.swift
//  shuLaiBao
//
//  Created by liangli on 16/1/25.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBAboutUsView: UIView {
    let iconImageView = UIImageView()
    let versionLabel = UILabel()
    let contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        
        // 图标ImageView
        iconImageView.frame = CGRect(x: 0, y: 64 + 40, width: 80, height: 80)
        iconImageView.centerX = myScreenSize.width / 2
        iconImageView.image = UIImage(named: "congLeBao")
        iconImageView.layer.cornerRadius = 10
        iconImageView.layer.masksToBounds = true
         addSubview(iconImageView)
        
        // 版本Label
        versionLabel.frame = CGRect(x: 0, y: iconImageView.maxY + 20, width: myScreenSize.width, height: 20)
        versionLabel.text = "数来宝1.0"
        versionLabel.font = UIFont.systemFont(ofSize: 15)
        versionLabel.textAlignment = .center
        addSubview(versionLabel)
        
        
        // 文字label
        contentLabel.frame = CGRect(x: 20, y: versionLabel.maxY + 30, width: MyScreenWith - 40, height: 200)
        contentLabel.text = "    聪乐宝专门为4-6岁儿童所设计的一款关于数学计算和动手画画的App,画一画版面以提供线稿的方式来启蒙宝宝动手画出漂亮的画面而设计.玩一玩功能将以玩游戏的方式来练习宝宝对数学计算的兴趣.\n    我们将打造更好玩儿的App,在这里希望您给我们提供更好的建议或反馈,我们将不胜感激.\n    通过QQ联系我们:\n    刘邓: 956965495 \n    苏睿: 799588489 "
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.numberOfLines = 0
        contentLabel.lineBreakMode = .byWordWrapping
        addSubview(contentLabel)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
