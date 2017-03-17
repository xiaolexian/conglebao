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
        backGroundImage.frame = CGRect(x: 0, y: 0, width: MyScreenWith, height: MyScreenHeight)
        addSubview(backGroundImage)
        
        // 2. 返回按钮
        backBtn.frame = CGRect(x: 10, y: 10, width: 33, height: 33)
        backBtn.setBackgroundImage(UIImage(named: "back_btn"), for: UIControlState())
        addSubview(backBtn)
        
        // 3. 钻石添加按钮
        diamondBtn.setBackgroundImage(UIImage(named: "diamond"), for: UIControlState())
        diamondBtn.setBackgroundImage(UIImage(named: "diamond_hight"), for: .highlighted)
        let diamondBtnW = diamondBtn.currentBackgroundImage?.size.width
        let diamondBtnH = diamondBtn.currentBackgroundImage?.size.height
        diamondBtn.frame = CGRect(x: MyScreenWith - diamondBtnW! - 5, y: 5, width: diamondBtnW!, height: diamondBtnH!)
        addSubview(diamondBtn)
        
        // 4. 钻石数
        diamondCount.frame = CGRect(x: 5, y: 0, width: diamondBtnW!, height: diamondBtnH!)
        diamondCount.text = "20"
        diamondCount.textColor = UIColor.white
        diamondCount.font = UIFont.boldSystemFont(ofSize: 14)
        diamondCount.shadowColor = UIColor.black
        diamondCount.shadowOffset = CGSize(width: 1.0, height: 1.0)
        diamondCount.textAlignment = .center
        diamondBtn.addSubview(diamondCount)
        
        // 5. 太阳花按钮
        sunFlowerBtn.setBackgroundImage(UIImage(named: "energy_btn"), for: UIControlState())
        sunFlowerBtn.setBackgroundImage(UIImage(named: "energy_btn_hight"), for: .highlighted)
        let sunFlowerBtnW = sunFlowerBtn.currentBackgroundImage?.size.width
        let sunFlowerBtnH = sunFlowerBtn.currentBackgroundImage?.size.height
        sunFlowerBtn.frame = CGRect(x: MyScreenWith - sunFlowerBtnW! - 5, y: diamondBtn.maxY + 7.5, width: sunFlowerBtnW!, height: sunFlowerBtnH!)
        addSubview(sunFlowerBtn)
        
        // 6. 太阳花数
        sunFlowerCount.frame = CGRect(x: 5, y: 2, width: sunFlowerBtnW!, height: sunFlowerBtnH!)
        sunFlowerCount.text = "20/30"
        sunFlowerCount.textColor = UIColor.white
        sunFlowerCount.font = UIFont.boldSystemFont(ofSize: 13)
        sunFlowerCount.shadowColor = UIColor.black
        sunFlowerCount.shadowOffset = CGSize(width: 1.0, height: 1.0)
        sunFlowerCount.textAlignment = .center
        sunFlowerBtn.addSubview(sunFlowerCount)
        
        // 7. 倒计时
        countDown.frame = CGRect(x: sunFlowerBtn.x + 5, y: sunFlowerBtn.maxY, width: sunFlowerBtnW!, height: 15)
        countDown.text = "6:30"
        countDown.textColor = UIColor.white
        countDown.font = UIFont.boldSystemFont(ofSize: 14)
        countDown.shadowColor = UIColor.black
        countDown.shadowOffset = CGSize(width: 1.0, height: 1.0)
        countDown.textAlignment = .center
         addSubview(countDown)
        
        // 8. 初级
        primaryBtn.setBackgroundImage(UIImage(named: "primary_btn"), for: UIControlState())
        primaryBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.3, (primaryBtn.currentBackgroundImage?.size.width)!, (primaryBtn.currentBackgroundImage?.size.height)!)
        addSubview(primaryBtn)
        
        // 8.1 初级文字
        primaryWord.text = NSLocalizedString("junior", comment: "")
        primaryWord.textAlignment = .center
        primaryWord.textColor = UIColor.white
        primaryWord.font = UIFont(name: "STHupo", size: 24)
        primaryWord.shadowColor = UIColor.black
        primaryWord.shadowOffset = CGSize(width: 1.0, height: 1.0)
        primaryWord.frame = CGRectMakeWithCenter(primaryBtn.width * 0.5, primaryBtn.height * 0.4, primaryBtn.width, primaryBtn.height)
        primaryBtn.addSubview(primaryWord)
        
        // 8.2 初级花
        primaryFlower.image = UIImage(named: "sunFlower")
        primaryFlower.frame = CGRectMakeWithCenter(primaryBtn.width * 0.43, primaryBtn.height * 0.83, primaryFlower.image!.size.width, primaryFlower.image!.size.height)
        primaryBtn.addSubview(primaryFlower)
        
        // 8.3 初级消耗数
        primaryCount.text = "2"
        primaryCount.frame = CGRect(x: primaryFlower.maxX + 5, y: primaryFlower.y, width: primaryFlower.width, height: primaryFlower.height)
        primaryCount.textColor = UIColor.white
        primaryCount.font = UIFont(name: "STHupo", size: 20)
        primaryBtn.addSubview(primaryCount)
        
        // 9. 中级
        midBtn.setBackgroundImage(UIImage(named: "mid_btn"), for: UIControlState())
        midBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.5, (midBtn.currentBackgroundImage?.size.width)!, (midBtn.currentBackgroundImage?.size.height)!)
        addSubview(midBtn)
        
        // 9.1 中级文字
        midWord.text = NSLocalizedString("intermediate", comment: "")
        midWord.textAlignment = .center
        midWord.textColor = UIColor.white
        midWord.font = UIFont(name: "STHupo", size: 24)
        midWord.shadowColor = UIColor.black
        midWord.shadowOffset = CGSize(width: 1.0, height: 1.0)
        midWord.frame = CGRectMakeWithCenter(midBtn.width * 0.5, midBtn.height * 0.4, midBtn.width, midBtn.height)
        midBtn.addSubview(midWord)
        
        // 9.2 初级花
        midFlower.image = UIImage(named: "sunFlower")
        midFlower.frame = CGRectMakeWithCenter(midBtn.width * 0.43, midBtn.height * 0.83, midFlower.image!.size.width, midFlower.image!.size.height)
        midBtn.addSubview(midFlower)
        
        // 9.3 初级消耗数
        midCount.text = "3"
        midCount.frame = CGRect(x: midFlower.maxX + 5, y: midFlower.y, width: midFlower.width, height: midFlower.height)
        midCount.textColor = UIColor.white
        midCount.font = UIFont(name: "STHupo", size: 20)
        midBtn.addSubview(midCount)

        
        // 10. 高级
        hightBtn.setBackgroundImage(UIImage(named: "hight_btn"), for: UIControlState())
        hightBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.7, (hightBtn.currentBackgroundImage?.size.width)!, (hightBtn.currentBackgroundImage?.size.height)!)
        addSubview(hightBtn)
        
        // 10.1 高级文字
        hightWord.text = NSLocalizedString("senior", comment: "")
        hightWord.textAlignment = .center
        hightWord.textColor = UIColor.white
        hightWord.font = UIFont(name: "STHupo", size: 24)
        hightWord.shadowColor = UIColor.black
        hightWord.shadowOffset = CGSize(width: 1.0, height: 1.0)
        hightWord.frame = CGRectMakeWithCenter(hightBtn.width * 0.5, hightBtn.height * 0.4, hightBtn.width, hightBtn.height)
        hightBtn.addSubview(hightWord)
        
        // 10.2 初级花
        hightFlower.image = UIImage(named: "sunFlower")
        hightFlower.frame = CGRectMakeWithCenter(hightBtn.width * 0.43, hightBtn.height * 0.83, hightFlower.image!.size.width, hightFlower.image!.size.height)
        hightBtn.addSubview(hightFlower)
        
        // 9.3 初级消耗数
        hightCount.text = "5"
        hightCount.frame = CGRect(x: hightFlower.maxX + 5, y: hightFlower.y, width: hightFlower.width, height: hightFlower.height)
        hightCount.textColor = UIColor.white
        hightCount.font = UIFont(name: "STHupo", size: 20)
        hightBtn.addSubview(hightCount)
        
        // 11. 帮助
        helpBtn.setBackgroundImage(UIImage(named: "help_btn"), for: UIControlState())
        helpBtn.frame = CGRect(x: 12, y: MyScreenHeight - 12 - (helpBtn.currentBackgroundImage?.size.height)!, width: (helpBtn.currentBackgroundImage?.size.width)!, height: (helpBtn.currentBackgroundImage?.size.height)!)
        addSubview(helpBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
