//
//  SLBAboutUsViewController.swift
//  shuLaiBao
//
//  Created by liangli on 16/1/25.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBAboutUsViewController: UIViewController {
    var versionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置标题
        title = "关于我们"
        
        // 初始化视图
        setupView()
    }
    
    // MARK: - 初始化视图
    func setupView() {
        let aboutUsView = SLBAboutUsView()
        aboutUsView.frame = view.bounds
        view.addSubview(aboutUsView)
        
        // 版本Label
        versionLabel = aboutUsView.versionLabel
        let key = String(kCFBundleVersionKey)
        let md = Bundle.main.infoDictionary
        let currentVersion = md![key]!
         versionLabel.text = "\(NSLocalizedString("smartBabyStr", comment: "")) \(currentVersion)"

        
        
    }
}
