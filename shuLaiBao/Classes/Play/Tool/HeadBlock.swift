//
//  HeadBlock.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/19.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

class HeadBlock: SnakeBlock {
    let centerView = UIImageView()
    var direction: Direction = Direction.Right {
        willSet {
            switch newValue {
            case Direction.Up:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Down)
            case Direction.Down:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Up)
            case Direction.Left:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Right)
            case Direction.Right:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Left)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        centerView.frame = CGRectMake(0, 0, frame.width, frame.height)
        centerView.image = UIImage.init(named: "head")
        addSubview(centerView)
    }
    
    
    override var frame: CGRect {
        didSet {
            centerView.frame = CGRectMake(0, 0, frame.width, frame.height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
