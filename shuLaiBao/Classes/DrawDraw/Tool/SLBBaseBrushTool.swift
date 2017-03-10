//
//  SLBBaseBrushTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/15.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

protocol PaintBrush {
    /**  表示是否连续不断地绘图  */
    func supportedContinuousDrawing() -> Bool;
    /**  基于Context（上下文）的绘图方法，子类必须实现具体的绘图  */
    func drawInContext(context: CGContextRef)
}

/**
 * BaseBrush将会作为一个绘图的基类而存在，我们会在它的基础上创建一系列的子类，以达到弹性的设计目的
 */
class SLBBaseBrushTool: NSObject, PaintBrush {
    /**  开始点的位置  */
    var beginPoint: CGPoint!
    /**  结束点的位置  */
    var endPoint: CGPoint!
    /**  最后一个点的位置（也可以称作是上一个点的位置）  */
    var lastPoint: CGPoint?
    /**  画笔的宽度  */
    var strokeWidth: CGFloat!
    
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    func drawInContext(context: CGContextRef) {
        assert(false, "must implements in subclass")
    }
}
