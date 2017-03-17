

//
//  SLBAddPreviewColorTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/20.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBAddPreviewColorTool: UIView {
    var btnArray = [UIButton]()
    let colorArray = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow,UIColor.orange, UIColor.purple]

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        
        for index in 1...6{
            let btn = UIButton()
            btn.layer.cornerRadius = 10
            btn.tag = index
            btn.layer.masksToBounds = true
            addSubview(btn)
            btn.addTarget(self, action: #selector(SLBAddPreviewColorTool.btnClick(_:)), for: .touchUpInside)
            btn.backgroundColor = colorArray[index - 1]
            btnArray.append(btn)
        }
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var padding = CGFloat(10)
    let btnW = (MyScreenWith - 7 * 10) / 6
    
    override func layoutSubviews() {
        for indext in 0..<btnArray.count{
            let btn = btnArray[indext]
            btn.frame = CGRect(x: 10 + CGFloat(indext) * CGFloat(btnW + padding), y: 0, width: btnW, height: btnW)
        }
    }
    
    func btnClick(_ sender: UIButton){
        
    }

}
