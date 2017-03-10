//
//  SLBBarButttonItem.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/31.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBBarButttonItem: UIBarButtonItem {

    static func bauttonItem(targets:AnyObject, actions:Selector, imageName:String,hightImaeName:String)->UIBarButtonItem{
        let btn = UIButton()
        btn.addTarget(targets, action: actions, forControlEvents: .TouchUpInside)
        btn.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: hightImaeName), forState: .Highlighted)
        btn.size = (btn.currentBackgroundImage?.size)!
        return UIBarButtonItem(customView: btn)
    }
}
