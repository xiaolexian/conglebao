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
    var direction: Direction = Direction.Right {
        willSet {
            switch newValue {
            case Direction.Up:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Left)
            case Direction.Down:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Right)
            case Direction.Left:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Down)
            case Direction.Right:
                centerView.image = UIImage.init(CGImage: centerView.image!.CGImage!, scale: 1, orientation: UIImageOrientation.Up)
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
