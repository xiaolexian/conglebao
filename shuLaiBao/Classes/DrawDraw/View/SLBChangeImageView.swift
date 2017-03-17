


//
//  SLBChangeImageView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/20.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBChangeImageView: UIView {
    /** 更换背景的view导航栏 */
    var navChangeBackground:UIImageView!
    /** 标题 */
    var titleLabel:UILabel!
    /** 返回 */
    var backBtn:UIButton!
    /** 布局*/
    var flowLayout:UICollectionViewFlowLayout!
    var myCollectionView:UICollectionView!
    var backgroundView:UIImageView!
    var reInAppPurchase:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
//         backgroundColor = UIColor.lightGrayColor()
        
        backgroundView = UIImageView()
        backgroundView.frame = CGRect(x: 0 , y: 0, width: MyScreenWith, height: MyScreenHeight)
        backgroundView.image = UIImage(named: "drawChangeBg")
        addSubview(backgroundView)
        
        // 1. 更换背景view
        navChangeBackground = UIImageView()
        navChangeBackground.isUserInteractionEnabled = true
        navChangeBackground.image = UIImage(named: "drawDrawNav")
         navChangeBackground.frame = CGRect(x: 0, y: 0, width: MyScreenWith, height: 64)
        addSubview(navChangeBackground)
        
 
        // 1.1 标题
        titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("changeBackgroundStr", comment: "")
        titleLabel.shadowColor = UIColor.black
        titleLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, 20 + 10, MyScreenWith, 44)
        navChangeBackground.addSubview(titleLabel)
        
        
        // 1.2 返回按钮
        backBtn = UIButton()
        backBtn.frame = CGRect(x: 10, y: 10, width: 33, height: 33)
//        backBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
//        backBtn.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
//        backBtn.setTitle(NSLocalizedString("backStr", comment: "备注"), forState: .Normal)
//        backBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
         backBtn.setBackgroundImage(UIImage(named: "back_btn"), for: UIControlState())
         navChangeBackground.addSubview(backBtn)
        
        
        reInAppPurchase = UIButton()
        reInAppPurchase.frame = CGRect(x: navChangeBackground.width - 70 - 10, y: 10, width: 70, height: 44)
        reInAppPurchase.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        reInAppPurchase.setTitle(NSLocalizedString("restorePurchase", comment: ""), for: UIControlState())
        reInAppPurchase.setTitleShadowColor(UIColor.black, for: UIControlState())
        reInAppPurchase.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 1.0)
         navChangeBackground.addSubview(reInAppPurchase)
        
        // 2. 创建uicollectViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        
        // 2.1 创建UICollectView
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 64, width: MyScreenWith, height: MyScreenHeight - 64), collectionViewLayout: flowLayout)
        myCollectionView.backgroundColor = UIColor.clear
        addSubview(myCollectionView)
        
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
