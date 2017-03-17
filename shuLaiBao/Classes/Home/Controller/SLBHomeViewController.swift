    //
//  ViewController.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/12.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBHomeViewController: UIViewController, UIGestureRecognizerDelegate{
    var homeV:SLBHomeV!
     var btnCenterDic = [UIView : CGPoint]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LDAudioPlayerTool.shareAudioPlayer.thePlayers.play()
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LDAudioPlayerTool.shareAudioPlayer.thePlayers.pause()

    }
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        print("首页显示完毕")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. 初始化视图
        setupView()
       }
    
    //    MARK: - 初始化视图方法
    func setupView() {
        homeV = SLBHomeV(frame: view.bounds)
        view.addSubview(homeV)
        homeV.shuShu.addTarget(self, action: #selector(SLBHomeViewController.shushuClick), for: .touchUpInside)
        homeV.drawDraw.addTarget(self, action: #selector(SLBHomeViewController.drawdrawClick), for: .touchUpInside)
        homeV.setting.addTarget(self, action: #selector(SLBHomeViewController.settingClick), for: .touchUpInside)
        homeV.countingBtn.addTarget(self, action: #selector(SLBHomeViewController.countingBtnClick), for: .touchUpInside)
        imageAnimation("shuGuan_0", imageNumber: 8, RepeatCount: 0, imageViews: homeV.shuRenImage, duration: 0.15)
        imageAnimation("CaiDie_0", imageNumber: 10, RepeatCount: 0, imageViews: homeV.caiDie, duration: 0.1)
        imageAnimation("CaiDie_0", imageNumber: 10, RepeatCount: 0, imageViews: homeV.caiDieTwo, duration: 0.1)
        
        homeV.shuRenImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(SLBHomeViewController.imagePathClick)))
        homeV.setting.addGestureRecognizer( UIPanGestureRecognizer(target: self, action: #selector(SLBHomeViewController.settingPan(_:))))
        homeV.drawDraw.addGestureRecognizer( UIPanGestureRecognizer(target: self, action: #selector(SLBHomeViewController.settingPan(_:))))
        homeV.shuShu.addGestureRecognizer( UIPanGestureRecognizer(target: self, action: #selector(SLBHomeViewController.settingPan(_:))))
        homeV.countingBtn.addGestureRecognizer( UIPanGestureRecognizer(target: self, action: #selector(SLBHomeViewController.settingPan(_:))))
            }
 
    
    // Mark: - 画一画/玩一玩/数一数/设置
    func settingPan(_ sender: UIPanGestureRecognizer){
         switch sender.state{
        case .began:
              btnCenterDic[sender.view!] = sender.view!.center
        case .changed:
            UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .curveLinear, animations: { () -> Void in
                sender.view!.center = sender.location(in: self.view)
                }, completion: nil)
          case .ended:
             UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .curveLinear, animations: { () -> Void in
                sender.view!.center = self.btnCenterDic[sender.view!]!
            
                }, completion: nil)
          default :
            break
        }
    }
    
    func countingBtnClick(){
        let countingVC = SLBCountingViewController()
        navigationController?.pushViewController(countingVC, animated: true)
    }
    
    //    MARK:- 设置按钮点击
    func settingClick(){
        let settingAlert = SLBSettingAlertTool()
        settingAlert.pingFenBtn.addTarget(self, action: #selector(SLBHomeViewController.pingFenBtnClick), for: .touchUpInside)

        settingAlert.frame = view.bounds
        view.addSubview(settingAlert)
    }
    //MARK:- 点击设置里面评分按钮
    func pingFenBtnClick(){
        
        let parentPFClickView = SLBOnlyParentAlterTool()
        parentPFClickView.frame = view.bounds
        view.addSubview(parentPFClickView)
        parentPFClickView.parentOnly = {isParent in
            if isParent == true{
                 let openURL = URL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=1073796861&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8")
                UIApplication.shared.openURL(openURL!)
            }
        }
    }
    
    //    MARK: - 数一数按钮点击事件
    func shushuClick(){
        print("数一数")
//        let snakeVC = SnakeViewController()
//        navigationController?.pushViewController(snakeVC, animated: true)
        let selectVC = SLBSelectPlayViewController()
        navigationController?.pushViewController(selectVC, animated: true)
    }
    
    //    MARK:- 点击树怪
    func imagePathClick(){
         self.imageAnimation("ShuGuaiBeiDa_0", imageNumber: 9, RepeatCount: 1, imageViews: homeV.shuRenImage, duration: 0.15)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(8 * 0.15 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in
            self.imageAnimation("shuGuan_0", imageNumber: 8, RepeatCount: 0, imageViews: self.homeV.shuRenImage, duration: 0.15)
        }
    }
    
    //    MARK: - 画一画按钮点击事件
    func drawdrawClick(){
        let drawDrawVC = SLBDrawDrawViewController()
        navigationController?.pushViewController(drawDrawVC, animated: true)
        print("画一画")
    }
    
    //    MARK:- 序列动画
    func imageAnimation(_ imageName:String, imageNumber: Int, RepeatCount: Int, imageViews:UIImageView, duration: CGFloat){
         var imagArray = [UIImage]()
        for indext in 0..<imageNumber{
            let imageStr = String(format: "\(imageName)%d",indext)
            let images = UIImage(named: imageStr)
            imagArray.append(images!)
        }
        imageViews.animationImages = imagArray
        imageViews.animationRepeatCount = RepeatCount
        imageViews.animationDuration = Double(CGFloat(imageNumber) * duration)
        imageViews.startAnimating()
    }
    
}

