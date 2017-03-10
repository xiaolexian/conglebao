//
//  SLBContactUsView.swift
//  shuLaiBao
//
//  Created by liangli on 16/1/25.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBContactUsView: UIView {
    let contentTextView = UITextView()
    let placeholderLabel = UILabel()
    let numberLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        
        // 方框背景View
        let bgView = UIView()
        
        bgView.frame = CGRectMake(5, 64 + 20, myScreenSize.width - 10, 100)
        bgView.layer.borderColor = UIColor.blackColor().CGColor
        bgView.layer.borderWidth = 0.5
        addSubview(bgView)
        
        // 空的View防止TextView自动偏移
        bgView.addSubview(UIView())
        
        // 内容TextView
        contentTextView.frame = CGRectMake(0, 0, bgView.width - 20, bgView.height - 20)
        contentTextView.font = UIFont.systemFontOfSize(14)
        bgView.addSubview(contentTextView)
        
        // 占位文字Label
        placeholderLabel.frame = CGRectMake(5, 5, contentTextView.width, 20)
        placeholderLabel.text = "请输入产品意见,我们将不断优化体验"
        placeholderLabel.font = UIFont.systemFontOfSize(14)
        placeholderLabel.textColor = UIColor.lightGrayColor()
        bgView.addSubview(placeholderLabel)
        
        // 字数Label
        let numberLabelW: CGFloat = 80
        let numberLabelH: CGFloat = 30
        numberLabel.frame = CGRectMake(myScreenSize.width - numberLabelW, bgView.height - numberLabelH - 10, numberLabelW, numberLabelH);
        numberLabel.text = "0/100";
        numberLabel.textColor = UIColor.lightGrayColor()
        numberLabel.textAlignment = .Center
        bgView.addSubview(numberLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
