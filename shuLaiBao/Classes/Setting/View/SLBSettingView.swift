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
        backgroundColor = UIColor.white
        
        settingTableView.frame = CGRect(x: 0, y: 0, width: myScreenSize.width, height: myScreenSize.height)
        settingTableView.separatorStyle = .none
        addSubview(settingTableView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
