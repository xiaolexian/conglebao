//
//  SLBEraserTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/19.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBEraserTool: SLBPencilBrush {
    override func drawInContext(_ context: CGContext) {
        context.setBlendMode(.clear)
        super.drawInContext(context)
    }
}
