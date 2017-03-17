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
    var direction: Direction = Direction.right {
        willSet {
            switch newValue {
            case Direction.up:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.down)
            case Direction.down:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.up)
            case Direction.left:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.right)
            case Direction.right:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.left)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        centerView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        centerView.image = UIImage.init(named: "head")
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
