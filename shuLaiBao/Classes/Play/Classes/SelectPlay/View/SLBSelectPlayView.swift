//
//  SLBSelectPlayView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/3/23.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBSelectPlayView: UIView {

    var backGroundImage = UIImageView()
    var backBtn        = UIButton()
    var diamondBtn     = UIButton()
    var sunFlowerBtn   = UIButton()
    var diamondCount   = UILabel()
    var sunFlowerCount = UILabel()
    var countDown      = UILabel()
    var primaryBtn     = UIButton()
    var primaryWord    = UILabel()
    var primaryFlower  = UIImageView()
    var primaryCount   = UILabel()
    var midBtn         = UIButton()
    var midWord        = UILabel()
    var midFlower      = UIImageView()
    var midCount       = UILabel()
    var hightBtn       = UIButton()
    var hightWord      = UILabel()
    var hightFlower    = UIImageView()
    var hightCount     = UILabel()
    var helpBtn        = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 1. 背景图
        backGroundImage.image = UIImage(named: "selectPlay_Bg")
        backGroundImage.frame = CGRectMake(0, 0, MyScreenWith, MyScreenHeight)
        addSubview(backGroundImage)
        
        // 2. 返回按钮
        backBtn.frame = CGRectMake(10, 10, 33, 33)
        backBtn.setBackgroundImage(UIImage(named: "back_btn"), forState: .Normal)
        addSubview(backBtn)
        
        // 3. 钻石添加按钮
        diamondBtn.setBackgroundImage(UIImage(named: "diamond"), forState: .Normal)
        diamondBtn.setBackgroundImage(UIImage(named: "diamond_hight"), forState: .Highlighted)
        let diamondBtnW = diamondBtn.currentBackgroundImage?.size.width
        let diamondBtnH = diamondBtn.currentBackgroundImage?.size.height
        diamondBtn.frame = CGRectMake(MyScreenWith - diamondBtnW! - 5, 5, diamondBtnW!, diamondBtnH!)
        addSubview(diamondBtn)
        
        // 4. 钻石数
        diamondCount.frame = CGRectMake(5, 0, diamondBtnW!, diamondBtnH!)
        diamondCount.text = "20"
        diamondCount.textColor = UIColor.whiteColor()
        diamondCount.font = UIFont.boldSystemFontOfSize(14)
        diamondCount.shadowColor = UIColor.blackColor()
        diamondCount.shadowOffset = CGSizeMake(1.0, 1.0)
        diamondCount.textAlignment = .Center
        diamondBtn.addSubview(diamondCount)
        
        // 5. 太阳花按钮
        sunFlowerBtn.setBackgroundImage(UIImage(named: "energy_btn"), forState: .Normal)
        sunFlowerBtn.setBackgroundImage(UIImage(named: "energy_btn_hight"), forState: .Highlighted)
        let sunFlowerBtnW = sunFlowerBtn.currentBackgroundImage?.size.width
        let sunFlowerBtnH = sunFlowerBtn.currentBackgroundImage?.size.height
        sunFlowerBtn.frame = CGRectMake(MyScreenWith - sunFlowerBtnW! - 5, diamondBtn.maxY + 7.5, sunFlowerBtnW!, sunFlowerBtnH!)
        addSubview(sunFlowerBtn)
        
        // 6. 太阳花数
        sunFlowerCount.frame = CGRectMake(5, 2, sunFlowerBtnW!, sunFlowerBtnH!)
        sunFlowerCount.text = "20/30"
        sunFlowerCount.textColor = UIColor.whiteColor()
        sunFlowerCount.font = UIFont.boldSystemFontOfSize(13)
        sunFlowerCount.shadowColor = UIColor.blackColor()
        sunFlowerCount.shadowOffset = CGSizeMake(1.0, 1.0)
        sunFlowerCount.textAlignment = .Center
        sunFlowerBtn.addSubview(sunFlowerCount)
        
        // 7. 倒计时
        countDown.frame = CGRectMake(sunFlowerBtn.x + 5, sunFlowerBtn.maxY, sunFlowerBtnW!, 15)
        countDown.text = "6:30"
        countDown.textColor = UIColor.whiteColor()
        countDown.font = UIFont.boldSystemFontOfSize(14)
        countDown.shadowColor = UIColor.blackColor()
        countDown.shadowOffset = CGSizeMake(1.0, 1.0)
        countDown.textAlignment = .Center
         addSubview(countDown)
        
        // 8. 初级
        primaryBtn.setBackgroundImage(UIImage(named: "primary_btn"), forState: .Normal)
        primaryBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.3, (primaryBtn.currentBackgroundImage?.size.width)!, (primaryBtn.currentBackgroundImage?.size.height)!)
        addSubview(primaryBtn)
        
        // 8.1 初级文字
        primaryWord.text = NSLocalizedString("junior", comment: "")
        primaryWord.textAlignment = .Center
        primaryWord.textColor = UIColor.whiteColor()
        primaryWord.font = UIFont(name: "STHupo", size: 24)
        primaryWord.shadowColor = UIColor.blackColor()
        primaryWord.shadowOffset = CGSizeMake(1.0, 1.0)
        primaryWord.frame = CGRectMakeWithCenter(primaryBtn.width * 0.5, primaryBtn.height * 0.4, primaryBtn.width, primaryBtn.height)
        primaryBtn.addSubview(primaryWord)
        
        // 8.2 初级花
        primaryFlower.image = UIImage(named: "sunFlower")
        primaryFlower.frame = CGRectMakeWithCenter(primaryBtn.width * 0.43, primaryBtn.height * 0.83, primaryFlower.image!.size.width, primaryFlower.image!.size.height)
        primaryBtn.addSubview(primaryFlower)
        
        // 8.3 初级消耗数
        primaryCount.text = "2"
        primaryCount.frame = CGRectMake(primaryFlower.maxX + 5, primaryFlower.y, primaryFlower.width, primaryFlower.height)
        primaryCount.textColor = UIColor.whiteColor()
        primaryCount.font = UIFont(name: "STHupo", size: 20)
        primaryBtn.addSubview(primaryCount)
        
        // 9. 中级
        midBtn.setBackgroundImage(UIImage(named: "mid_btn"), forState: .Normal)
        midBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.5, (midBtn.currentBackgroundImage?.size.width)!, (midBtn.currentBackgroundImage?.size.height)!)
        addSubview(midBtn)
        
        // 9.1 中级文字
        midWord.text = NSLocalizedString("intermediate", comment: "")
        midWord.textAlignment = .Center
        midWord.textColor = UIColor.whiteColor()
        midWord.font = UIFont(name: "STHupo", size: 24)
        midWord.shadowColor = UIColor.blackColor()
        midWord.shadowOffset = CGSizeMake(1.0, 1.0)
        midWord.frame = CGRectMakeWithCenter(midBtn.width * 0.5, midBtn.height * 0.4, midBtn.width, midBtn.height)
        midBtn.addSubview(midWord)
        
        // 9.2 初级花
        midFlower.image = UIImage(named: "sunFlower")
        midFlower.frame = CGRectMakeWithCenter(midBtn.width * 0.43, midBtn.height * 0.83, midFlower.image!.size.width, midFlower.image!.size.height)
        midBtn.addSubview(midFlower)
        
        // 9.3 初级消耗数
        midCount.text = "3"
        midCount.frame = CGRectMake(midFlower.maxX + 5, midFlower.y, midFlower.width, midFlower.height)
        midCount.textColor = UIColor.whiteColor()
        midCount.font = UIFont(name: "STHupo", size: 20)
        midBtn.addSubview(midCount)

        
        // 10. 高级
        hightBtn.setBackgroundImage(UIImage(named: "hight_btn"), forState: .Normal)
        hightBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.7, (hightBtn.currentBackgroundImage?.size.width)!, (hightBtn.currentBackgroundImage?.size.height)!)
        addSubview(hightBtn)
        
        // 10.1 高级文字
        hightWord.text = NSLocalizedString("senior", comment: "")
        hightWord.textAlignment = .Center
        hightWord.textColor = UIColor.whiteColor()
        hightWord.font = UIFont(name: "STHupo", size: 24)
        hightWord.shadowColor = UIColor.blackColor()
        hightWord.shadowOffset = CGSizeMake(1.0, 1.0)
        hightWord.frame = CGRectMakeWithCenter(hightBtn.width * 0.5, hightBtn.height * 0.4, hightBtn.width, hightBtn.height)
        hightBtn.addSubview(hightWord)
        
        // 10.2 初级花
        hightFlower.image = UIImage(named: "sunFlower")
        hightFlower.frame = CGRectMakeWithCenter(hightBtn.width * 0.43, hightBtn.height * 0.83, hightFlower.image!.size.width, hightFlower.image!.size.height)
        hightBtn.addSubview(hightFlower)
        
        // 9.3 初级消耗数
        hightCount.text = "5"
        hightCount.frame = CGRectMake(hightFlower.maxX + 5, hightFlower.y, hightFlower.width, hightFlower.height)
        hightCount.textColor = UIColor.whiteColor()
        hightCount.font = UIFont(name: "STHupo", size: 20)
        hightBtn.addSubview(hightCount)
        
        // 11. 帮助
        helpBtn.setBackgroundImage(UIImage(named: "help_btn"), forState: .Normal)
        helpBtn.frame = CGRectMake(12, MyScreenHeight - 12 - (helpBtn.currentBackgroundImage?.size.height)!, (helpBtn.currentBackgroundImage?.size.width)!, (helpBtn.currentBackgroundImage?.size.height)!)
        addSubview(helpBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
