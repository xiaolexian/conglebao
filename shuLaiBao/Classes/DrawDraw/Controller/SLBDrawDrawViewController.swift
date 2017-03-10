
//
//  SLBDrawDrawViewController.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/13.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBDrawDrawViewController: UIViewController, UIScrollViewDelegate {
    var drawDrawV:SLBDrawDrawView!
    var brushSettingView:SLBBrushSettingView!
    var imageBackGround:UIImage!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //默认值
        imageBackGround = UIImage(named: "HaiTun_00")
        print("gg")
        
        // 初始化视图
        setupView()
        
        // 点击画板的block
        self.drawDrawV.paintViewTool.drawingStateChangeBlock = {(state: DrawingState)->()in
            
            if state != .Moved {
                if state == .Began{
                    UIView.animateWithDuration(0.3, animations: { () -> Void in
                        self.brushSettingView.frame = CGRectMake(0, MyScreenHeight , MyScreenWith, 300)
                        }, completion: nil)
                 }
            }
        }
    }
    
    func setupView(){
         drawDrawV = SLBDrawDrawView(frame: view.bounds)
        drawDrawV.paintViewTool.brush = SLBPencilBrush()
        view.addSubview(drawDrawV)
        
        // 设置比例
        drawDrawV.drawDrawScrollView.delegate = self
        drawDrawV.drawDrawScrollView.maximumZoomScale = 2
        drawDrawV.drawDrawScrollView.minimumZoomScale = 1
        
        // 按钮的事件方法
        drawDrawV.backButton.addTarget(self, action: #selector(SLBDrawDrawViewController.backButtonClick), forControlEvents: .TouchUpInside)
        drawDrawV.saveBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.saveBtnClick), forControlEvents: .TouchUpInside)
        drawDrawV.eraserBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.eraserBtnClick(_:)), forControlEvents: .TouchUpInside)
        drawDrawV.drawPencil.addTarget(self, action: #selector(SLBDrawDrawViewController.drawPencilBtnClick(_:)), forControlEvents: .TouchUpInside)
        drawDrawV.drawSetting.addTarget(self, action: #selector(SLBDrawDrawViewController.drawSettingBtnClick), forControlEvents: .TouchUpInside)
        drawDrawV.changeImageBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.changeImageBtnClick), forControlEvents: .TouchUpInside)
        drawDrawV.allScreenBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.allScreenBtnClick(_:)), forControlEvents: .TouchUpInside)

        // 画笔设置
        brushSettingView = SLBBrushSettingView(frame: CGRectMake(0, MyScreenHeight , MyScreenWith, 300))
        view.addSubview(brushSettingView)
        brushSettingView.strokeWSlider.addTarget(self, action: #selector(SLBDrawDrawViewController.strokeWSliderClick(_:)), forControlEvents: .ValueChanged)
        self.drawDrawV.undo.addTarget(self, action: #selector(SLBDrawDrawViewController.undoClick), forControlEvents: .TouchUpInside)
        self.drawDrawV.redo.addTarget(self, action: #selector(SLBDrawDrawViewController.redoClick), forControlEvents: .TouchUpInside)

        // 设置画笔的颜色
        brushSettingView.strokeColorChangedBlock = {
            (color: UIColor) in
            self.drawDrawV.paintViewTool.strokeColor = color
            self.drawDrawV.paintViewTool.brush = SLBPencilBrush()
        }
        
        brushSettingView.doneBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.doneClick), forControlEvents: .TouchUpInside)
        
        // 选择六个按钮的方法
        for indext in 0..<brushSettingView.addPreviewColor.btnArray.count{
            let btn = brushSettingView.addPreviewColor.btnArray[indext]
            btn.addTarget(self, action: #selector(SLBDrawDrawViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
        }
    }
    
 
    //    MARK:- 全屏按钮
    func allScreenBtnClick(sender: UIButton){
        sender.selected = !sender.selected
        if sender.selected { // 全屏显示
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.drawDrawV.drawDrawTabbar.y = MyScreenHeight
                self.drawDrawV.drawDrawNav.y = -self.drawDrawV.drawDrawNav.height
                sender.y = sender.y + 60
                self.drawDrawV.undo.y =  self.drawDrawV.undo.y + 60
                self.drawDrawV.redo.y =  self.drawDrawV.redo.y + 60
                }, completion:nil)
        }else{   // 退出全屏
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.drawDrawV.drawDrawTabbar.y = MyScreenHeight - 80
                self.drawDrawV.drawDrawNav.y = 0
                sender.y = sender.y - 60
                self.drawDrawV.undo.y =  self.drawDrawV.undo.y - 60
                self.drawDrawV.redo.y =  self.drawDrawV.redo.y - 60
                }, completion:nil)
        }
    }
    
    func undoClick(){
         drawDrawV.paintViewTool.undo()
     }
    
    func redoClick(){
         drawDrawV.paintViewTool.redo()
     }
    
      //    MARK:- 更换图片按钮
    func changeImageBtnClick(){
        let changeImageVC = SLBChangeImageViewController()
        navigationController?.pushViewController(changeImageVC, animated: true)
        changeImageVC.imageBlock = {
            (name: UIImage) in
            self.drawDrawV.paintViewTool.clearImageArray()
            self.imageBackGround = name
            self.drawDrawV.paintViewTool.imageView.image =  name
            self.drawDrawV.paintViewTool.clearDraw()
            self.drawDrawV.paintViewTool.alpha = 0.1
            self.drawDrawV.drawDrawScrollView.zoomScale = 0.1
             UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.drawDrawV.drawDrawScrollView.zoomScale = 1
                
                self.drawDrawV.paintViewTool.alpha = 1
                
                }, completion: { (Bool) -> Void in
            })
        }
    }
    
    //    MARK:- 点击完成按钮
    func doneClick(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.brushSettingView.frame = CGRectMake(0, MyScreenHeight , MyScreenWith, 300)
            }, completion: nil)
    }
    
    //    MARK:- 颜色按钮点击方法
    func btnClick(sender: UIButton){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.brushSettingView.frame = CGRectMake(0, MyScreenHeight , MyScreenWith, 300)
            }, completion: nil)
        drawDrawV.paintViewTool.brush = SLBPencilBrush()
        self.drawDrawV.paintViewTool.strokeColor = sender.backgroundColor!
        self.brushSettingView.backgroundPicker.setCurrentColor(sender.backgroundColor!)
        self.brushSettingView.previewColorView.backgroundColor = sender.backgroundColor!
    }
    
    
    func strokeWSliderClick(sender: UISlider){
        drawDrawV.paintViewTool.strokeWidth = CGFloat(sender.value)
        brushSettingView.drawBrushLowWH.text = String(format: "%.1f", sender.value)
    }
    
    func backButtonClick(){
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    //    MARK:- 保存按钮
    func saveBtnClick(){
        let oldImage = self.drawDrawV.paintViewTool.takeImage()
        UIGraphicsBeginImageContext(view.size)
        oldImage.drawInRect(CGRectMake(0, 0, view.size.width, view.size.height))
        
        let newImge = imageBackGround
        newImge?.drawInRect(CGRectMake(0, 0, view.size.width, view.size.height))
        
        let nn = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(nn!, self, #selector(SLBDrawDrawViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Float>) {
        if let err = error {
            let alert = UIAlertController(title: NSLocalizedString("failStr", comment: ""), message: err.localizedDescription, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("commitStr", comment: ""), style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        } else {
            
            
            let alert = UIAlertController(title: NSLocalizedString("tip", comment: ""), message: NSLocalizedString("saveSecusess", comment: ""), preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("commitStr", comment: ""), style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    //    MARK:- 橡皮擦按钮
    func eraserBtnClick(sender: UIButton){
        drawDrawV.paintViewTool.brush = SLBEraserTool()
        sender.enabled = false
        drawDrawV.drawPencil.enabled = true
    }
    func drawPencilBtnClick(sender: UIButton){
        drawDrawV.paintViewTool.brush = SLBPencilBrush()
        sender.enabled = false
        drawDrawV.eraserBtn.enabled = true
    }
    
    // MARK:- 画笔设置
    func drawSettingBtnClick(){
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.brushSettingView.frame = CGRectMake(0, MyScreenHeight - 300 , MyScreenWith, 300)
            }, completion: nil)
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        scrollView.scrollEnabled = false
        
        let offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0
        let offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0
        drawDrawV.paintViewTool.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
        
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return drawDrawV.paintViewTool
        
    }
    
    
    
    
    
    
    
    
}
