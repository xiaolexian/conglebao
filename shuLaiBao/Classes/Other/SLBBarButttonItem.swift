//
//  SLBBarButttonItem.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/31.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBBarButttonItem: UIBarButtonItem {

    static func bauttonItem(_ targets:AnyObject, actions:Selector, imageName:String,hightImaeName:String)->UIBarButtonItem{
        let btn = UIButton()
        btn.addTarget(targets, action: actions, for: .touchUpInside)
        btn.setBackgroundImage(UIImage(named: imageName), for: UIControlState())
        btn.setBackgroundImage(UIImage(named: hightImaeName), for: .highlighted)
        btn.size = (btn.currentBackgroundImage?.size)!
        return UIBarButtonItem(customView: btn)
    }
}
