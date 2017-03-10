
//
//  AppDelegate.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/12.
//  Copyright © 2016 liudeng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var nav:UINavigationController!
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
          
        // 隐藏状态栏
        UIApplication.sharedApplication().setStatusBarHidden(true, withAnimation: .Fade)
        
        //创建窗口
        window = UIWindow(frame: MyScreen)
        
        // 创建跟视图控制器
        let mainVC = SLBHomeViewController()
        nav = SLBNavViewController(rootViewController: mainVC)
        self.window?.rootViewController = nav
        NSThread.sleepForTimeInterval(1.5)
        //显示窗口
        window?.makeKeyAndVisible()
        
        // 添加启动图片放大消失
        launchScreenScale()
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        if (nav.viewControllers.count > 1 && nav.viewControllers[1].isKindOfClass(SnakeViewController)){
            let vc = nav.viewControllers[1] as! SnakeViewController
            vc.gameStop()
        }
        
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        if (nav.viewControllers.count > 1 &&  nav.viewControllers[1].isKindOfClass(SnakeViewController)){
            let vc = nav.viewControllers[1] as! SnakeViewController
            if (vc.isGameStar == true) {
                vc.gameContinue()
            }
        }
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func launchScreenScale(){
        
        // 0. 获取window的尺寸size
        let getWindowSize = window?.bounds.size
        
        // 1. 设备的方向(目前聪乐宝只支持竖屏)
        let deviceOrientation = "Portrait"
        
        // 2. 定义启动图片的名称
        var launchImage = ""
        
        // 3. 获取系统所支持的启动图数组
        let getLaunchImagesArray = NSBundle.mainBundle().objectForInfoDictionaryKey("UILaunchImages")!
        
        // 4. 遍历启动图数组
        for launchImageDic in getLaunchImagesArray as! [[NSObject: AnyObject]]{
            
            // 4.1 从遍历出的字典中得到图片的尺寸
            let launchImageSize = CGSizeFromString(launchImageDic["UILaunchImageSize"] as! String)
            
            // 4.2 判断如果遍历出的szie和设备size相同并且设备的朝向相同的话,就从字典里面取出启动图片的名称
            if (CGSizeEqualToSize(launchImageSize, getWindowSize!) && deviceOrientation == launchImageDic["UILaunchImageOrientation"] as! String){
                launchImage = launchImageDic["UILaunchImageName"] as! String
            }
        }
        
        // 5. 新创建一个ImageView
        let newLaunchView = UIImageView(image: UIImage(named: launchImage))
        
        // 5.1 设置新建ImageView的frame
        newLaunchView.frame = (window?.bounds)!
        
        // 5.2 设置新建ImageView的内容显示模式
        newLaunchView.contentMode = .ScaleAspectFill
        
        // 5.3 将新建ImageView添加到window上
        window?.addSubview(newLaunchView)
        
        // 6. 添加ImageView消失动画,并在动画结束完之后销毁掉ImageView
        UIView.animateWithDuration(0.7, delay: 0.0, options: .BeginFromCurrentState, animations: { () -> Void in
            newLaunchView.alpha = 0
            newLaunchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.8, 1.8, 1)
            }) { (Bool) -> Void in
                newLaunchView.removeFromSuperview()
        }
    }
    
}



