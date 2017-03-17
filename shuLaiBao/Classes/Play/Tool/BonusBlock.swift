//
//  BonusBlock.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/19.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

class BonusBlock: SnakeBlock {
    let centerView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        centerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        centerView.image = UIImage.init(named: "bonus")
        addSubview(centerView)
    }
    
    
    override var frame: CGRect {
        didSet {
            centerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
