
//
//  SLBBrushSettingView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/19.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBBrushSettingView: UIImageView {
    var strokeColorChangedBlock: ((strokeColor: UIColor) -> Void)?
    
    var drawBrushMaxWH:UILabel!
    var drawBrushWH:UILabel!
    var drawBrushLowWH:UILabel!
    var strokeWSlider:UISlider!
    var customColorStrLabel:UILabel!
    var previewColorView:UIView!
    var backgroundPicker:SLBCustomPickerTool!
    var doneBtn:UIButton!
    var addPreviewColor:SLBAddPreviewColorTool!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        userInteractionEnabled = true
        backgroundColor = UIColor.whiteColor()
        
        // 画笔
        drawBrushWH = UILabel(frame: CGRectMake(10 , 10 , 100 , 20))
        drawBrushWH.font = UIFont.systemFontOfSize(12)
        drawBrushWH.text = NSLocalizedString("brushSettings", comment: "")
        addSubview(drawBrushWH)
        
        // 画笔
        drawBrushLowWH = UILabel(frame: CGRectMake(10 , drawBrushWH.frame.maxY + 10 , 30 , 20))
        drawBrushLowWH.font = UIFont.systemFontOfSize(12)
        drawBrushLowWH.textAlignment =  .Center
        drawBrushLowWH.text = "10.0"
        addSubview(drawBrushLowWH)
        
        // 画笔数
        strokeWSlider = UISlider()
        strokeWSlider.minimumValue = 1
        strokeWSlider.maximumValue = 30
        strokeWSlider.value = 10
        strokeWSlider.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, drawBrushLowWH.centerY, MyScreenWith - 70, 10)
        addSubview(strokeWSlider)
        
        // 画笔最大数
        drawBrushMaxWH = UILabel(frame: CGRectMake(MyScreenWith - 30 , drawBrushLowWH.y , 30 , 20))
        drawBrushMaxWH.font = UIFont.systemFontOfSize(12)
        drawBrushMaxWH.textAlignment =  .Center
        drawBrushMaxWH.text = "30.0"
        addSubview(drawBrushMaxWH)
        
        // 自定义颜色文本
        customColorStrLabel = UILabel(frame: CGRectMake(10 , drawBrushLowWH.maxY + 10 , 60 , 20))
        customColorStrLabel.font = UIFont.systemFontOfSize(12)
        customColorStrLabel.text = NSLocalizedString("customColorStr", comment: "")
        addSubview(customColorStrLabel)
        
        // 预览View
        previewColorView = UIView(frame: CGRectMake(customColorStrLabel.maxX + 10, customColorStrLabel.y , MyScreenWith - 60 - customColorStrLabel.width, customColorStrLabel.height))
        previewColorView.backgroundColor = UIColor.blackColor()
        previewColorView.layer.borderColor = UIColor.blackColor().CGColor
        previewColorView.layer.borderWidth = 1
        addSubview(previewColorView)
        
        //滑竿的背景
        backgroundPicker = SLBCustomPickerTool(frame: CGRectMake(10, previewColorView.maxY + 10, MyScreenWith - 20, 120))
        addSubview(backgroundPicker)
        
        // 完成按钮
        doneBtn = UIButton(frame: CGRectMake(MyScreenWith - 60, drawBrushWH.y, 50, 20))
        doneBtn.setTitle(NSLocalizedString("okStr", comment: ""), forState: .Normal)
        doneBtn.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
        doneBtn.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
        doneBtn.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
         doneBtn.setBackgroundImage(UIImage(named: "commitBtn_icon"), forState: .Normal)
        addSubview(doneBtn)
         
        // 预设颜色
        addPreviewColor = SLBAddPreviewColorTool(frame: CGRectMake(0 , backgroundPicker.maxY + 10, MyScreenWith, 50))
        addSubview(addPreviewColor)
        
        backgroundPicker.colorChangeBlock = {
            (color: UIColor) in
            self.previewColorView.backgroundColor = color
            if let strokeColorChangedBlock = self.strokeColorChangedBlock {
                strokeColorChangedBlock(strokeColor: color)
            }
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
