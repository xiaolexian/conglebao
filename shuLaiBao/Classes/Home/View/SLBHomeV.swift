
//
//  SLBHomeV.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/13.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBHomeV: UIView {
    var drawDraw:UIButton!
    var shuShu:UIButton!
    var setting:UIButton!
    var shuRenImage:UIImageView!
    var homeBg:UIImageView!
    var qianJing:UIImageView!
    var caiDie:UIImageView!
    var caiDieTwo:UIImageView!
    var countingBtn:UIButton!
    var diamondBtn:UIButton!
    var diamondCount:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 首页背景颜色
        backgroundColor = UIColor.lightGrayColor()
        
        homeBg = UIImageView()
        homeBg.frame = CGRectMake(0, 0, MyScreenWith, MyScreenHeight)
        homeBg.image = UIImage(named: "home_Bg")
        addSubview(homeBg)
        
        caiDie = UIImageView()
        caiDie.userInteractionEnabled = true
        let caiDieW:CGFloat = 110
        let caiDieH:CGFloat = 120
        caiDie.frame = CGRectMake(10, -15, caiDieW, caiDieH)
        addSubview(caiDie)
        
        shuRenImage = UIImageView()
        shuRenImage.userInteractionEnabled = true
        let shuRenHW = MyScreenHeight * 0.5
        shuRenImage.frame = CGRectMake(-50, MyScreenHeight - shuRenHW + 30, shuRenHW, shuRenHW)
        addSubview(shuRenImage)
        
        // 前景草
        qianJing = UIImageView()
        qianJing.frame = CGRectMake(0, MyScreenHeight - 57, MyScreenWith, 57)
        qianJing.image = UIImage(named: "qianJing")
        addSubview(qianJing)
        
        // 画一画
        drawDraw = UIButton()
        drawDraw.tag = 0
        drawDrawBut(caiDie.x + 30, y: caiDie.maxY - 25, w: 95, h: 40, title: "", butName: drawDraw)
        drawDraw.setBackgroundImage(UIImage(named: "DrawDerawIcon"), forState: .Normal)
        
        caiDieTwo = UIImageView()
        caiDieTwo.userInteractionEnabled = true
        let caiDieTwoW:CGFloat = 150
        let caiDieTwoH:CGFloat = 160
        caiDieTwo.frame = CGRectMake(drawDraw.maxX - 60, drawDraw.maxY - 40, caiDieTwoW, caiDieTwoH)
        addSubview(caiDieTwo)
        
        // 玩一玩
        shuShu = UIButton()
        shuShu.tag = 1
        drawDrawBut(100, y: 200, w: 180, h: 60, title: "", butName: shuShu)
        shuShu.setBackgroundImage(UIImage(named: "playPlay"), forState: .Normal)
        addSubview(shuShu)
        addSubview(drawDraw)
        
        // 设置
        setting = UIButton()
        setting.tag = 2
        drawDrawBut(MyScreenWith - 140 , y: MyScreenHeight - 45 - 45, w: 140, h: 45, title: "", butName: setting)
        setting.setBackgroundImage(UIImage(named: "settingIcon"), forState: .Normal)
        addSubview(setting)
        
        // 数一数
        countingBtn = UIButton()
        countingBtn.tag = 3
        drawDrawBut(MyScreenWith - 140 - 20, y: MyScreenHeight * 0.6 , w: 140, h: 45, title: "", butName: countingBtn)
        countingBtn.setBackgroundImage(UIImage(named: "counting_icon"), forState: .Normal)
          addSubview(countingBtn)
        
        // 添加钻石按钮
        diamondBtn = UIButton()
        diamondBtn.setBackgroundImage(UIImage(named: "diamond"), forState: .Normal)
        diamondBtn.setBackgroundImage(UIImage(named: "diamond_hight"), forState: .Highlighted)
        let diamondBtnW = diamondBtn.currentBackgroundImage?.size.width
        let diamondBtnH = diamondBtn.currentBackgroundImage?.size.height
        diamondBtn.frame = CGRectMake(MyScreenWith - diamondBtnW! - 15, 15, diamondBtnW!, diamondBtnH!)
        addSubview(diamondBtn)
        
        // 钻石数
        diamondCount = UILabel()
        diamondCount.frame = CGRectMake(5, 0, diamondBtnW!, diamondBtnH!)
        diamondCount.text = "20"
        diamondCount.textColor = UIColor.whiteColor()
        diamondCount.font = UIFont.boldSystemFontOfSize(14)
        diamondCount.shadowColor = UIColor.blackColor()
        diamondCount.shadowOffset = CGSizeMake(1.0, 1.0)
        diamondCount.textAlignment = .Center
        diamondBtn.addSubview(diamondCount)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawDrawBut(x: CGFloat, y:CGFloat, w:CGFloat, h:CGFloat, title:String, butName:UIButton) {
        butName.setTitle(title, forState: .Normal)
        butName.frame = CGRectMake(x, y, w, h)
    }
    
}
