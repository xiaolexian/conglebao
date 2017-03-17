//
//  BodyBlock.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/13.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

class BodyBlock: SnakeBlock {
    let centerView = UIImageView()
    var direction: Direction = Direction.right {
        willSet {
            switch newValue {
            case Direction.up:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.left)
            case Direction.down:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.right)
            case Direction.left:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.down)
            case Direction.right:
                centerView.image = UIImage.init(cgImage: centerView.image!.cgImage!, scale: 1, orientation: UIImageOrientation.up)
            }
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
         centerView.image = UIImage(named: "bonus")
        addSubview(centerView)
    }
    
    override var frame: CGRect {
        didSet {
            centerView.frame = CGRectMakeWithCenter(self.width / 2, self.height / 2, self.width, self.height )
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
