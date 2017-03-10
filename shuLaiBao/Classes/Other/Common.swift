//
//  Common.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/12.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

let emailArr = ["liudeng1989@163.com", "799588489@qq.com"]

public var MyScreen: CGRect{
    return  UIScreen.mainScreen().bounds
}

public var MyScreenHeight: CGFloat{
    return  UIScreen.mainScreen().bounds.size.height
}

public var MyScreenWith: CGFloat{
    return  UIScreen.mainScreen().bounds.size.width
}

public var myScreenSize: CGSize{
    return  UIScreen.mainScreen().bounds.size
}

// RGB颜色
public func RGBColor(r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}


// 随机数
public func myRandom(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max) + 1))
}
public func myRandom(min: Int, max: Int) -> Int {
    return myRandom(max - min) + min
}

// 判断设备
public func deviceTypeIpone4() ->Bool{
     return UIScreen.mainScreen().bounds.size.height == 480
}
public func deviceTypeIpone5s() ->Bool{
    return UIScreen.mainScreen().bounds.size.height == 568
}