//
//  SnakeBlock.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/18.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

struct Position {
    var col: Int
    var row: Int
}
func PositionMake(col: Int, _ row: Int) -> Position {
    return Position(col: col, row: row)
}
func PositionEqualToPosition(p1: Position, _ p2: Position) -> Bool {
    return p1.col == p2.col && p1.row == p2.row
}

class SnakeBlock: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(position: Position, size: CGSize) {
        self.init()
        self.frame = CGRectMake(CGFloat(position.col) * size.width, CGFloat(position.row) * size.height, size.width, size.height)
        self.size = size
        self.position = position
    }
    
    var position: Position = PositionMake(0, 0) {
        willSet {
            self.frame = CGRectMake(CGFloat(newValue.col) * self.width, CGFloat(newValue.row) * self.height, self.width, self.height);
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
