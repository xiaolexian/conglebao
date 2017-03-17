
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
        backgroundColor = UIColor.lightGray
        
        homeBg = UIImageView()
        homeBg.frame = CGRect(x: 0, y: 0, width: MyScreenWith, height: MyScreenHeight)
        homeBg.image = UIImage(named: "home_Bg")
        addSubview(homeBg)
        
        caiDie = UIImageView()
        caiDie.isUserInteractionEnabled = true
        let caiDieW:CGFloat = 110
        let caiDieH:CGFloat = 120
        caiDie.frame = CGRect(x: 10, y: -15, width: caiDieW, height: caiDieH)
        addSubview(caiDie)
        
        shuRenImage = UIImageView()
        shuRenImage.isUserInteractionEnabled = true
        let shuRenHW = MyScreenHeight * 0.5
        shuRenImage.frame = CGRect(x: -50, y: MyScreenHeight - shuRenHW + 30, width: shuRenHW, height: shuRenHW)
        addSubview(shuRenImage)
        
        // 前景草
        qianJing = UIImageView()
        qianJing.frame = CGRect(x: 0, y: MyScreenHeight - 57, width: MyScreenWith, height: 57)
        qianJing.image = UIImage(named: "qianJing")
        addSubview(qianJing)
        
        // 画一画
        drawDraw = UIButton()
        drawDraw.tag = 0
        drawDrawBut(caiDie.x + 30, y: caiDie.maxY - 25, w: 95, h: 40, title: "", butName: drawDraw)
        drawDraw.setBackgroundImage(UIImage(named: "DrawDerawIcon"), for: UIControlState())
        
        caiDieTwo = UIImageView()
        caiDieTwo.isUserInteractionEnabled = true
        let caiDieTwoW:CGFloat = 150
        let caiDieTwoH:CGFloat = 160
        caiDieTwo.frame = CGRect(x: drawDraw.maxX - 60, y: drawDraw.maxY - 40, width: caiDieTwoW, height: caiDieTwoH)
        addSubview(caiDieTwo)
        
        // 玩一玩
        shuShu = UIButton()
        shuShu.tag = 1
        drawDrawBut(100, y: 200, w: 180, h: 60, title: "", butName: shuShu)
        shuShu.setBackgroundImage(UIImage(named: "playPlay"), for: UIControlState())
        addSubview(shuShu)
        addSubview(drawDraw)
        
        // 设置
        setting = UIButton()
        setting.tag = 2
        drawDrawBut(MyScreenWith - 140 , y: MyScreenHeight - 45 - 45, w: 140, h: 45, title: "", butName: setting)
        setting.setBackgroundImage(UIImage(named: "settingIcon"), for: UIControlState())
        addSubview(setting)
        
        // 数一数
        countingBtn = UIButton()
        countingBtn.tag = 3
        drawDrawBut(MyScreenWith - 140 - 20, y: MyScreenHeight * 0.6 , w: 140, h: 45, title: "", butName: countingBtn)
        countingBtn.setBackgroundImage(UIImage(named: "counting_icon"), for: UIControlState())
          addSubview(countingBtn)
        
        // 添加钻石按钮
        diamondBtn = UIButton()
        diamondBtn.setBackgroundImage(UIImage(named: "diamond"), for: UIControlState())
        diamondBtn.setBackgroundImage(UIImage(named: "diamond_hight"), for: .highlighted)
        let diamondBtnW = diamondBtn.currentBackgroundImage?.size.width
        let diamondBtnH = diamondBtn.currentBackgroundImage?.size.height
        diamondBtn.frame = CGRect(x: MyScreenWith - diamondBtnW! - 15, y: 15, width: diamondBtnW!, height: diamondBtnH!)
        addSubview(diamondBtn)
        
        // 钻石数
        diamondCount = UILabel()
        diamondCount.frame = CGRect(x: 5, y: 0, width: diamondBtnW!, height: diamondBtnH!)
        diamondCount.text = "20"
        diamondCount.textColor = UIColor.white
        diamondCount.font = UIFont.boldSystemFont(ofSize: 14)
        diamondCount.shadowColor = UIColor.black
        diamondCount.shadowOffset = CGSize(width: 1.0, height: 1.0)
        diamondCount.textAlignment = .center
        diamondBtn.addSubview(diamondCount)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawDrawBut(_ x: CGFloat, y:CGFloat, w:CGFloat, h:CGFloat, title:String, butName:UIButton) {
        butName.setTitle(title, for: UIControlState())
        butName.frame = CGRect(x: x, y: y, width: w, height: h)
    }
    
}
