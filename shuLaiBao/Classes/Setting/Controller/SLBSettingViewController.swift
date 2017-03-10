//
//  SLBSettingViewController.swift
//  shuLaiBao
//
//  Created by liangli on 16/1/22.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

private struct SLBSettingTableViewCellStruct {
    var img: String
    var content: String
}

class SLBSettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var navBackButton = UIButton()
    var settingTableView: UITableView!
    private var settingTableViewCellStruct: Array<SLBSettingTableViewCellStruct> {
        return [
            SLBSettingTableViewCellStruct(img: "", content: "意见反馈"),
            SLBSettingTableViewCellStruct(img: "", content: "关于我们")
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化导航栏
        title = "设置"
        navigationController?.navigationBarHidden = false
        
        // 初始化视图
        setupView()
    }
    
    // MARK: - 初始化视图
    func setupView() {
        let settingView = SLBSettingView()
        settingView.frame = view.bounds
        view.addSubview(settingView)
        
        settingTableView = settingView.settingTableView
        settingTableView.dataSource = self
        settingTableView.delegate = self
    }
    
    // MARK: - TableView的数据源方法和代理方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
           let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        cell?.textLabel?.text = settingTableViewCellStruct[indexPath.row].content
        
        // 分割线
        let line = UIView()
        line.frame = CGRectMake(0, 43.5, myScreenSize.width, 0.5)
        line.backgroundColor = RGBColor(200, 200, 200)
        cell?.addSubview(line)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let contactUsViewController = SLBContactUsViewController()
            navigationController?.pushViewController(contactUsViewController, animated: true)
            
        case 1:
            let aboutUsViewController = SLBAboutUsViewController()
            navigationController?.pushViewController(aboutUsViewController, animated: true)
            
        default:
            break
        }
    }

}
