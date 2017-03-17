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
        backgroundColor = UIColor.white
        
        // 方框背景View
        let bgView = UIView()
        
        bgView.frame = CGRect(x: 5, y: 64 + 20, width: myScreenSize.width - 10, height: 100)
        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.layer.borderWidth = 0.5
        addSubview(bgView)
        
        // 空的View防止TextView自动偏移
        bgView.addSubview(UIView())
        
        // 内容TextView
        contentTextView.frame = CGRect(x: 0, y: 0, width: bgView.width - 20, height: bgView.height - 20)
        contentTextView.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(contentTextView)
        
        // 占位文字Label
        placeholderLabel.frame = CGRect(x: 5, y: 5, width: contentTextView.width, height: 20)
        placeholderLabel.text = "请输入产品意见,我们将不断优化体验"
        placeholderLabel.font = UIFont.systemFont(ofSize: 14)
        placeholderLabel.textColor = UIColor.lightGray
        bgView.addSubview(placeholderLabel)
        
        // 字数Label
        let numberLabelW: CGFloat = 80
        let numberLabelH: CGFloat = 30
        numberLabel.frame = CGRect(x: myScreenSize.width - numberLabelW, y: bgView.height - numberLabelH - 10, width: numberLabelW, height: numberLabelH);
        numberLabel.text = "0/100";
        numberLabel.textColor = UIColor.lightGray
        numberLabel.textAlignment = .center
        bgView.addSubview(numberLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
