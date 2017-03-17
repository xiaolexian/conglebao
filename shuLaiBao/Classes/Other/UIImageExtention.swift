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
    
   static func resizedImageWithName(_ names: String)->UIImage{
         let image = UIImage(named: names)
        return (image?.stretchableImage(withLeftCapWidth: Int((image?.size.width)! * 0.5), topCapHeight: Int((image?.size.height)! * 0.5) ))!
     }
     
    static func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height);
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img!;
    }
}

