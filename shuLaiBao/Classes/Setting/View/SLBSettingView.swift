//
//  SLBSettingView.swift
//  shuLaiBao
//
//  Created by liangli on 16/1/22.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBSettingView: UIView {
    let settingTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
        
        settingTableView.frame = CGRectMake(0, 0, myScreenSize.width, myScreenSize.height)
        settingTableView.separatorStyle = .None
        addSubview(settingTableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
