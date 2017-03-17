


//
//  SLBPencilBrush.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/15.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBPencilBrush: SLBBaseBrushTool {
    
    override func drawInContext(_ context: CGContext) {
        if let lastPoint = self.lastPoint {
            if (self.lastPoint != self.endPoint){
            context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
            context.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
            }
        } else {
//            CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
//            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
        }
    }
    
    override func supportedContinuousDrawing() -> Bool {
        return true
    }
}
