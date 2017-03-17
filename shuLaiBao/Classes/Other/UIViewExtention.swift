//
//  UIViewExtention.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/13.
//  Copyright © 2016年 liangli. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    var origin: CGPoint {
        get {
            return self.frame.origin
        }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    var minX: CGFloat {
        return self.frame.minX
    }
    var maxX: CGFloat {
        return self.frame.maxX
    }
    var minY: CGFloat {
        return self.frame.minY
    }
    var maxY: CGFloat {
        return self.frame.maxY
    }
}

public extension CGRect {
    init(centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat) {
        let origin = CGPoint(x: centerX - width / 2, y: centerY - height / 2)
        let size = CGSize(width: width, height: height)
        self.init(origin: origin, size: size)
    }
}

public func CGRectMakeWithCenter(_ centerX: CGFloat, _ centerY: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: centerX - width / 2, y: centerY - height / 2, width: width, height: height)
}
