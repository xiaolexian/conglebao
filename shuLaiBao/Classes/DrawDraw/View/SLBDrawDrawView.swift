
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
        backgroundColor = UIColor.lightGray
        
        // scrollView
        drawDrawScrollView = UIScrollView()
        drawDrawScrollView.frame = CGRect(centerX: MyScreenWith * 0.5, centerY: MyScreenHeight * 0.5, width: MyScreenWith, height: MyScreenHeight)
        addSubview(drawDrawScrollView)
         drawDrawScrollView.contentSize = CGSize(width: drawDrawScrollView.width, height: drawDrawScrollView.height)
        
        // 添加绘画视图
        paintViewTool = SLBPaintViewTool(image: nil)
        paintViewTool.frame = drawDrawScrollView.frame
        paintViewTool.backgroundColor = UIColor.white
        drawDrawScrollView.addSubview(paintViewTool)
        
        // 添加导航栏
        drawDrawNav = UIImageView()
        drawDrawNav.isUserInteractionEnabled = true
        drawDrawNav.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, 40, MyScreenWith, 80)
        drawDrawNav.image = UIImage(named: "drawDrawNav")
        addSubview(drawDrawNav)
        
        // 添加下部的tabbar
        drawDrawTabbar = UIImageView()
        drawDrawTabbar.isUserInteractionEnabled = true
        drawDrawTabbar.image = UIImage(named: "drawTabbarIcon")
        addSubview(drawDrawTabbar)
        
        // 标题
        titleDraw = UIButton()
        titleDraw.center = CGPoint(x: MyScreenWith * 0.5, y: 25 + 5 )
        titleDraw.setTitleColor(UIColor.white, for: UIControlState())
        titleDraw.bounds = CGRect(x: 0, y: 0, width: MyScreenWith, height: 50)
        titleDraw.setTitle(NSLocalizedString("littlePainterStr", comment: ""), for: UIControlState())
        titleDraw.setTitleShadowColor(UIColor.black, for: UIControlState())
        titleDraw.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        titleDraw.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        titleDraw.isHighlighted = false
        drawDrawNav.addSubview(titleDraw)
        
        // 添加返回按钮
        backButton = UIButton()
        backButton.frame = CGRect(x: 10, y: 10, width: 33, height: 33)
//        backButton.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
//        backButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
//        backButton.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
//        backButton.setTitle(NSLocalizedString("backStr", comment: ""), forState: .Normal)
        backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControlState())
        drawDrawNav.addSubview(backButton)
        
        // 保存按钮
        saveBtn = UIButton()
        saveBtn.frame = CGRect(x: MyScreenWith - 64, y: backButton.y, width: 44, height: 44)
        saveBtn.setTitle(NSLocalizedString("saveStr", comment: ""), for: UIControlState())
        saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        saveBtn.setTitleShadowColor(UIColor.black, for: UIControlState())
        saveBtn.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        saveBtn.setBackgroundImage(UIImage(named: "Play_Moves_green"), for: UIControlState())
        drawDrawNav.addSubview(saveBtn)
        
        // 画笔
        drawPencil = UIButton()
        drawPencil.frame = CGRect(x: 10, y: 25, width: 44, height: 44)
        drawPencil.setTitle(NSLocalizedString("brushStr", comment: ""), for: UIControlState())
        drawPencil.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        drawPencil.setTitleShadowColor(UIColor.black, for: UIControlState())
        drawPencil.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        drawPencil.setBackgroundImage(UIImage(named: "Play_scr"), for: UIControlState())
        drawPencil.setBackgroundImage(UIImage(named: "Play_scr"), for: .highlighted)
        drawPencil.setBackgroundImage(UIImage(named: "Play_scr_dis"), for: .disabled)
        drawPencil.isEnabled = false
        drawDrawTabbar.addSubview(drawPencil)
        
        // 橡皮擦
        eraserBtn = UIButton()
        eraserBtn.frame = CGRect(x: MyScreenWith - 54, y: drawPencil.y, width: drawPencil.width, height: drawPencil.height)
        eraserBtn.setTitle(NSLocalizedString("eraserStr", comment: ""), for: UIControlState())
        eraserBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        eraserBtn.setTitleShadowColor(UIColor.black, for: UIControlState())
        eraserBtn.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        eraserBtn.setBackgroundImage(UIImage(named: "Play_scr"), for: UIControlState())
        eraserBtn.setBackgroundImage(UIImage(named: "Play_scr"), for: .highlighted)
        eraserBtn.setBackgroundImage(UIImage(named: "Play_scr_dis"), for: .disabled)
        drawDrawTabbar.addSubview(eraserBtn)
        
        // 画笔设置
        drawSetting = UIButton()
        let drawSettingW:CGFloat = 80
        let drawSettingH:CGFloat = 35
        let drawSettingPading:CGFloat = (MyScreenWith - 2 * (10 + drawPencil.width) - 2 * drawSettingW) / 3
        drawSetting.frame = CGRect( x: drawPencil.maxX + drawSettingPading, y: drawPencil.y, width: drawSettingW, height: drawSettingH)
        drawSetting.centerY = drawPencil.centerY
        drawSetting.setTitle(NSLocalizedString("brushSettingStr", comment: ""), for: UIControlState())
        drawSetting.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        drawSetting.setTitleShadowColor(UIColor.black, for: UIControlState())
        drawSetting.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        drawSetting.setBackgroundImage(UIImage(named: "drawSetting"), for: UIControlState())
        drawDrawTabbar.addSubview(drawSetting)
        
        // 更换图片
        changeImageBtn = UIButton()
        changeImageBtn.frame = CGRect(x: drawSetting.maxX + drawSettingPading ,y: drawSetting.y, width: drawSettingW, height: drawSettingH)
        changeImageBtn.setTitle(NSLocalizedString("changePictureStr", comment: ""), for: UIControlState())
        changeImageBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        changeImageBtn.setTitleShadowColor(UIColor.black, for: UIControlState())
        changeImageBtn.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        changeImageBtn.setBackgroundImage(UIImage(named: "drawChangeBackground"), for: UIControlState())
        drawDrawTabbar.addSubview(changeImageBtn)
        
  
        
        //撤销按钮
        undo = UIButton()
        undo.setBackgroundImage(UIImage(named: "redo"), for: UIControlState())
         addSubview(undo)
        
        //撤销按钮
        redo = UIButton()
        redo.setBackgroundImage(UIImage(named: "redo"), for: UIControlState())
        redo.transform =  CGAffineTransform(scaleX: -1, y: 1)
        addSubview(redo)
        
        // 全屏按钮
         allScreenBtn = UIButton()
        allScreenBtn.setBackgroundImage(UIImage(named: "AllScreen"), for: UIControlState())
        allScreenBtn.setBackgroundImage(UIImage(named: "cancelAllScreen"), for: .selected)
        addSubview(allScreenBtn)
         
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawDrawTabbar.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight - 40, MyScreenWith, 80)
         undo.frame = CGRect(x: 10, y: drawDrawTabbar.y - 45, width: 45, height: 45)
        redo.frame = CGRect(x: MyScreenWith - 45 - 10, y: drawDrawTabbar.y - 45, width: 45, height: 45)
        allScreenBtn.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, undo.y + 45 / 2, 45, 45)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
