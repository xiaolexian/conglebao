//
//  SLBEraserTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/19.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBEraserTool: SLBPencilBrush {
    override func drawInContext(context: CGContextRef) {
        CGContextSetBlendMode(context, .Clear)
        super.drawInContext(context)
    }
}
