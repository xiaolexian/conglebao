
//
//  SLBDrawDrawView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/13.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBDrawDrawView: UIView {
    var backButton:UIButton!
    var titleDraw:UIButton!
    var paintViewTool:SLBPaintViewTool!
    var saveBtn:UIButton!
    var eraserBtn:UIButton!
    var drawPencil:UIButton!
    var drawSetting:UIButton!
    var changeImageBtn:UIButton!
    var drawDrawNav:UIImageView!
    var drawDrawTabbar:UIImageView!
     var drawDrawScrollView:UIScrollView!
    var undo:UIButton!
    var redo:UIButton!
    var allScreenBtn:UIButton!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 界面背景
        backgroundColor = UIColor.lightGrayColor()
        
        // scrollView
        drawDrawScrollView = UIScrollView()
        drawDrawScrollView.frame = CGRect(centerX: MyScreenWith * 0.5, centerY: MyScreenHeight * 0.5, width: MyScreenWith, height: MyScreenHeight)
        addSubview(drawDrawScrollView)
         drawDrawScrollView.contentSize = CGSizeMake(drawDrawScrollView.width, drawDrawScrollView.height)
        
        // 添加绘画视图
        paintViewTool = SLBPaintViewTool(image: nil)
        paintViewTool.frame = drawDrawScrollView.frame
        paintViewTool.backgroundColor = UIColor.whiteColor()
        drawDrawScrollView.addSubview(paintViewTool)
        
        // 添加导航栏
        drawDrawNav = UIImageView()
        drawDrawNav.userInteractionEnabled = true
        drawDrawNav.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, 40, MyScreenWith, 80)
        drawDrawNav.image = UIImage(named: "drawDrawNav")
        addSubview(drawDrawNav)
        
        // 添加下部的tabbar
        drawDrawTabbar = UIImageView()
        drawDrawTabbar.userInteractionEnabled = true
        drawDrawTabbar.image = UIImage(named: "drawTabbarIcon")
        addSubview(drawDrawTabbar)
        
        // 标题
        titleDraw = UIButton()
        titleDraw.center = CGPointMake(MyScreenWith * 0.5, 25 + 5 )
        titleDraw.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        titleDraw.bounds = CGRectMake(0, 0, MyScreenWith, 50)
        titleDraw.setTitle(NSLocalizedString("littlePainterStr", comment: ""), forState: .Normal)
        titleDraw.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        titleDraw.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        titleDraw.titleLabel?.font = UIFont.boldSystemFontOfSize(20)
        titleDraw.highlighted = false
        drawDrawNav.addSubview(titleDraw)
        
        // 添加返回按钮
        backButton = UIButton()
        backButton.frame = CGRectMake(10, 10, 33, 33)
//        backButton.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
//        backButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
//        backButton.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
//        backButton.setTitle(NSLocalizedString("backStr", comment: ""), forState: .Normal)
        backButton.setBackgroundImage(UIImage(named: "back_btn"), forState: .Normal)
        drawDrawNav.addSubview(backButton)
        
        // 保存按钮
        saveBtn = UIButton()
        saveBtn.frame = CGRectMake(MyScreenWith - 64, backButton.y, 44, 44)
        saveBtn.setTitle(NSLocalizedString("saveStr", comment: ""), forState: .Normal)
        saveBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
        saveBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        saveBtn.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        saveBtn.setBackgroundImage(UIImage(named: "Play_Moves_green"), forState: .Normal)
        drawDrawNav.addSubview(saveBtn)
        
        // 画笔
        drawPencil = UIButton()
        drawPencil.frame = CGRectMake(10, 25, 44, 44)
        drawPencil.setTitle(NSLocalizedString("brushStr", comment: ""), forState: .Normal)
        drawPencil.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
        drawPencil.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        drawPencil.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        drawPencil.setBackgroundImage(UIImage(named: "Play_scr"), forState: .Normal)
        drawPencil.setBackgroundImage(UIImage(named: "Play_scr"), forState: .Highlighted)
        drawPencil.setBackgroundImage(UIImage(named: "Play_scr_dis"), forState: .Disabled)
        drawPencil.enabled = false
        drawDrawTabbar.addSubview(drawPencil)
        
        // 橡皮擦
        eraserBtn = UIButton()
        eraserBtn.frame = CGRectMake(MyScreenWith - 54, drawPencil.y, drawPencil.width, drawPencil.height)
        eraserBtn.setTitle(NSLocalizedString("eraserStr", comment: ""), forState: .Normal)
        eraserBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        eraserBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        eraserBtn.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        eraserBtn.setBackgroundImage(UIImage(named: "Play_scr"), forState: .Normal)
        eraserBtn.setBackgroundImage(UIImage(named: "Play_scr"), forState: .Highlighted)
        eraserBtn.setBackgroundImage(UIImage(named: "Play_scr_dis"), forState: .Disabled)
        drawDrawTabbar.addSubview(eraserBtn)
        
        // 画笔设置
        drawSetting = UIButton()
        let drawSettingW:CGFloat = 80
        let drawSettingH:CGFloat = 35
        let drawSettingPading:CGFloat = (MyScreenWith - 2 * (10 + drawPencil.width) - 2 * drawSettingW) / 3
        drawSetting.frame = CGRectMake( drawPencil.maxX + drawSettingPading, drawPencil.y, drawSettingW, drawSettingH)
        drawSetting.centerY = drawPencil.centerY
        drawSetting.setTitle(NSLocalizedString("brushSettingStr", comment: ""), forState: .Normal)
        drawSetting.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        drawSetting.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        drawSetting.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        drawSetting.setBackgroundImage(UIImage(named: "drawSetting"), forState: .Normal)
        drawDrawTabbar.addSubview(drawSetting)
        
        // 更换图片
        changeImageBtn = UIButton()
        changeImageBtn.frame = CGRectMake(drawSetting.maxX + drawSettingPading ,drawSetting.y, drawSettingW, drawSettingH)
        changeImageBtn.setTitle(NSLocalizedString("changePictureStr", comment: ""), forState: .Normal)
        changeImageBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(12)
        changeImageBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        changeImageBtn.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        changeImageBtn.setBackgroundImage(UIImage(named: "drawChangeBackground"), forState: .Normal)
        drawDrawTabbar.addSubview(changeImageBtn)
        
  
        
        //撤销按钮
        undo = UIButton()
        undo.setBackgroundImage(UIImage(named: "redo"), forState: .Normal)
         addSubview(undo)
        
        //撤销按钮
        redo = UIButton()
        redo.setBackgroundImage(UIImage(named: "redo"), forState: .Normal)
        redo.transform =  CGAffineTransformMakeScale(-1, 1)
        addSubview(redo)
        
        // 全屏按钮
         allScreenBtn = UIButton()
        allScreenBtn.setBackgroundImage(UIImage(named: "AllScreen"), forState: .Normal)
        allScreenBtn.setBackgroundImage(UIImage(named: "cancelAllScreen"), forState: .Selected)
        addSubview(allScreenBtn)
         
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawDrawTabbar.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight - 40, MyScreenWith, 80)
         undo.frame = CGRectMake(10, drawDrawTabbar.y - 45, 45, 45)
        redo.frame = CGRectMake(MyScreenWith - 45 - 10, drawDrawTabbar.y - 45, 45, 45)
        allScreenBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, undo.y + 45 / 2, 45, 45)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
