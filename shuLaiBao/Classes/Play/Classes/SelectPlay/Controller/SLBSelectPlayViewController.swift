//
//  SLBSelectPlayViewController.swift
//  shuLaiBao
//
//  Created by liudeng on 16/3/23.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBSelectPlayViewController: UIViewController {
    var selectPlayV:SLBSelectPlayView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化视图
        setupView()

     }

//    MARK:- 初始化视图
    func setupView(){
        selectPlayV = SLBSelectPlayView()
        selectPlayV.frame = view.bounds
        view.addSubview(selectPlayV)
        
        selectPlayV.backBtn .addTarget(self, action: #selector(SLBSelectPlayViewController.backBtn), forControlEvents: .TouchUpInside)
        selectPlayV.primaryBtn.addTarget(self, action: #selector(SLBSelectPlayViewController.primaryBtnClick), forControlEvents: .TouchUpInside)
         selectPlayV.midBtn.addTarget(self, action: #selector(SLBSelectPlayViewController.midBtnClick), forControlEvents: .TouchUpInside)
        selectPlayV.hightBtn.addTarget(self, action: #selector(SLBSelectPlayViewController.hightBtnClick), forControlEvents: .TouchUpInside)

    }
    
    func backBtn() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // 初级按钮点击
    func primaryBtnClick() {
        let snakeVC = SnakeViewController()
        snakeVC.isPrimaryBtnClick = true
        navigationController?.pushViewController(snakeVC, animated: true)
    }
    
    // 中级按钮点击
    func midBtnClick() {
        let snakeVC = SnakeViewController()
        snakeVC.isMidBtnClick = true
        navigationController?.pushViewController(snakeVC, animated: true)
    }
    
    // 高级按钮点击
    func hightBtnClick() {
        let snakeVC = SnakeViewController()
        snakeVC.isHightBtnClick = true
        navigationController?.pushViewController(snakeVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
