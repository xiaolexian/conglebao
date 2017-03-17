
//
//  SLBNavViewController.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/21.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
             viewController.navigationItem.leftBarButtonItem = SLBBarButttonItem.bauttonItem(self, actions:#selector(SLBNavViewController.back), imageName: "nav_btn_back", hightImaeName: "nav_btn_back")
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func back() {
        popViewController(animated: true)
    }
}
