
//
//  SLBBrushSettingView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/19.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBBrushSettingView: UIImageView {
    var strokeColorChangedBlock: ((_ strokeColor: UIColor) -> Void)?
    
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
        isUserInteractionEnabled = true
        backgroundColor = UIColor.white
        
        // 画笔
        drawBrushWH = UILabel(frame: CGRect(x: 10 , y: 10 , width: 100 , height: 20))
        drawBrushWH.font = UIFont.systemFont(ofSize: 12)
        drawBrushWH.text = NSLocalizedString("brushSettings", comment: "")
        addSubview(drawBrushWH)
        
        // 画笔
        drawBrushLowWH = UILabel(frame: CGRect(x: 10 , y: drawBrushWH.frame.maxY + 10 , width: 30 , height: 20))
        drawBrushLowWH.font = UIFont.systemFont(ofSize: 12)
        drawBrushLowWH.textAlignment =  .center
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
        drawBrushMaxWH = UILabel(frame: CGRect(x: MyScreenWith - 30 , y: drawBrushLowWH.y , width: 30 , height: 20))
        drawBrushMaxWH.font = UIFont.systemFont(ofSize: 12)
        drawBrushMaxWH.textAlignment =  .center
        drawBrushMaxWH.text = "30.0"
        addSubview(drawBrushMaxWH)
        
        // 自定义颜色文本
        customColorStrLabel = UILabel(frame: CGRect(x: 10 , y: drawBrushLowWH.maxY + 10 , width: 60 , height: 20))
        customColorStrLabel.font = UIFont.systemFont(ofSize: 12)
        customColorStrLabel.text = NSLocalizedString("customColorStr", comment: "")
        addSubview(customColorStrLabel)
        
        // 预览View
        previewColorView = UIView(frame: CGRect(x: customColorStrLabel.maxX + 10, y: customColorStrLabel.y , width: MyScreenWith - 60 - customColorStrLabel.width, height: customColorStrLabel.height))
        previewColorView.backgroundColor = UIColor.black
        previewColorView.layer.borderColor = UIColor.black.cgColor
        previewColorView.layer.borderWidth = 1
        addSubview(previewColorView)
        
        //滑竿的背景
        backgroundPicker = SLBCustomPickerTool(frame: CGRect(x: 10, y: previewColorView.maxY + 10, width: MyScreenWith - 20, height: 120))
        addSubview(backgroundPicker)
        
        // 完成按钮
        doneBtn = UIButton(frame: CGRect(x: MyScreenWith - 60, y: drawBrushWH.y, width: 50, height: 20))
        doneBtn.setTitle(NSLocalizedString("okStr", comment: ""), for: UIControlState())
        doneBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        doneBtn.titleLabel?.shadowOffset = CGSize(width: 0.5, height: 1.0)
        doneBtn.setTitleShadowColor(UIColor.black, for: UIControlState())
         doneBtn.setBackgroundImage(UIImage(named: "commitBtn_icon"), for: UIControlState())
        addSubview(doneBtn)
         
        // 预设颜色
        addPreviewColor = SLBAddPreviewColorTool(frame: CGRect(x: 0 , y: backgroundPicker.maxY + 10, width: MyScreenWith, height: 50))
        addSubview(addPreviewColor)
        
        backgroundPicker.colorChangeBlock = {
            (color: UIColor) in
            self.previewColorView.backgroundColor = color
            if let strokeColorChangedBlock = self.strokeColorChangedBlock {
                strokeColorChangedBlock(color)
            }
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
