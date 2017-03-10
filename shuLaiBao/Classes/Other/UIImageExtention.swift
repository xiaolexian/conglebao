//
//  UIImageExtention.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/19.
//  Copyright © 2016年 liangli. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    
   static func resizedImageWithName(names: String)->UIImage{
         let image = UIImage(named: names)
        return (image?.stretchableImageWithLeftCapWidth(Int((image?.size.width)! * 0.5), topCapHeight: Int((image?.size.height)! * 0.5) ))!
     }
     
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context!, color.CGColor);
        CGContextFillRect(context!, rect);
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img!;
    }
}

