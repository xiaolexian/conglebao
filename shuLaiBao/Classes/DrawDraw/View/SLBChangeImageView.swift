


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
        backgroundView.frame = CGRectMake(0 , 0, MyScreenWith, MyScreenHeight)
        backgroundView.image = UIImage(named: "drawChangeBg")
        addSubview(backgroundView)
        
        // 1. 更换背景view
        navChangeBackground = UIImageView()
        navChangeBackground.userInteractionEnabled = true
        navChangeBackground.image = UIImage(named: "drawDrawNav")
         navChangeBackground.frame = CGRectMake(0, 0, MyScreenWith, 64)
        addSubview(navChangeBackground)
        
 
        // 1.1 标题
        titleLabel = UILabel()
        titleLabel.text = NSLocalizedString("changeBackgroundStr", comment: "")
        titleLabel.shadowColor = UIColor.blackColor()
        titleLabel.shadowOffset = CGSizeMake(1.0, 2.0)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.systemFontOfSize(20)
        titleLabel.textAlignment = .Center
        titleLabel.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, 20 + 10, MyScreenWith, 44)
        navChangeBackground.addSubview(titleLabel)
        
        
        // 1.2 返回按钮
        backBtn = UIButton()
        backBtn.frame = CGRectMake(10, 10, 33, 33)
//        backBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
//        backBtn.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
//        backBtn.setTitle(NSLocalizedString("backStr", comment: "备注"), forState: .Normal)
//        backBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
         backBtn.setBackgroundImage(UIImage(named: "back_btn"), forState: .Normal)
         navChangeBackground.addSubview(backBtn)
        
        
        reInAppPurchase = UIButton()
        reInAppPurchase.frame = CGRectMake(navChangeBackground.width - 70 - 10, 10, 70, 44)
        reInAppPurchase.titleLabel?.font = UIFont.systemFontOfSize(12)
        reInAppPurchase.setTitle(NSLocalizedString("restorePurchase", comment: ""), forState: .Normal)
        reInAppPurchase.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        reInAppPurchase.titleLabel?.shadowOffset = CGSizeMake(1.0, 1.0)
         navChangeBackground.addSubview(reInAppPurchase)
        
        // 2. 创建uicollectViewFlowLayout
        flowLayout = UICollectionViewFlowLayout()
        
        // 2.1 创建UICollectView
        myCollectionView = UICollectionView(frame: CGRectMake(0, 64, MyScreenWith, MyScreenHeight - 64), collectionViewLayout: flowLayout)
        myCollectionView.backgroundColor = UIColor.clearColor()
        addSubview(myCollectionView)
        
        
        
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
