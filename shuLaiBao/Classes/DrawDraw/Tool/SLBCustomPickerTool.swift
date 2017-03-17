
//
//  SLBCustomPickerTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/20.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBCustomPickerTool: UIView {
    /** 改变颜色的block*/
    var colorChangeBlock:((_ color: UIColor) ->Void)?
    var sliders = [UISlider]()
    var labels = [UILabel]()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        // 加载控件
        initial()
     }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func initial() {
        let trackColors = [UIColor.red, UIColor.green, UIColor.blue]
         for index in 1...3{
            let slider = UISlider()
            slider.minimumValue = 0
            slider.value = 0
            slider.maximumValue = 255
            slider.minimumTrackTintColor = trackColors[index - 1]
            slider.addTarget(self, action: #selector(SLBCustomPickerTool.colorChanged(_:)), for: .valueChanged)
            addSubview(slider)
            sliders.append(slider)
            
            let label = UILabel()
            label.text = "0"
            addSubview(label)
            labels.append(label)
        }
    }

    override func layoutSubviews() {
         super.layoutSubviews()
        let sliderHeight = CGFloat(31)
        let labelWidth = CGFloat(29)
        let yHeight = bounds.size.height / CGFloat(sliders.count)
        
        for index in 0..<sliders.count {
            let slider = sliders[index]
            slider.frame =  CGRect(x: 0, y: CGFloat(index) * yHeight, width:   bounds.size.width - labelWidth - 5.0, height: sliderHeight)
            
            let label = self.labels[index]
            label.frame = CGRect(x: slider.frame.maxX + 5, y: slider.frame.origin.y, width: labelWidth, height: sliderHeight)
        }
    }
    
    func colorChanged(_ slider: UISlider) {
        let color = UIColor(red: CGFloat(self.sliders[0].value / 255.0), green: CGFloat(self.sliders[1].value / 255.0), blue: CGFloat(self.sliders[2].value / 255.0), alpha: 1)
        
        let label = self.labels[self.sliders.index(of: slider)!]
        label.text = NSString(format: "%.0f", slider.value) as String
        label.font = UIFont.systemFont(ofSize: 15)
        
        if let colorChangedBlock =  colorChangeBlock {
            colorChangedBlock(color)
        }
    }

    func setCurrentColor(_ color: UIColor) {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: nil)
        let colors = [red, green, blue]
        
        for index in 0..<self.sliders.count {
            let slider = self.sliders[index]
            slider.value = Float(colors[index]) * 255
            
            let label = self.labels[index]
            label.font = UIFont.systemFont(ofSize: 15)
            label.text = String(format: "%.0f", slider.value)
        }
    }
    
}
