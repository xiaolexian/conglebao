
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
            
            if state != .moved {
                if state == .began{
                    UIView.animate(withDuration: 0.3, animations: { () -> Void in
                        self.brushSettingView.frame = CGRect(x: 0, y: MyScreenHeight , width: MyScreenWith, height: 300)
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
        drawDrawV.backButton.addTarget(self, action: #selector(SLBDrawDrawViewController.backButtonClick), for: .touchUpInside)
        drawDrawV.saveBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.saveBtnClick), for: .touchUpInside)
        drawDrawV.eraserBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.eraserBtnClick(_:)), for: .touchUpInside)
        drawDrawV.drawPencil.addTarget(self, action: #selector(SLBDrawDrawViewController.drawPencilBtnClick(_:)), for: .touchUpInside)
        drawDrawV.drawSetting.addTarget(self, action: #selector(SLBDrawDrawViewController.drawSettingBtnClick), for: .touchUpInside)
        drawDrawV.changeImageBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.changeImageBtnClick), for: .touchUpInside)
        drawDrawV.allScreenBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.allScreenBtnClick(_:)), for: .touchUpInside)

        // 画笔设置
        brushSettingView = SLBBrushSettingView(frame: CGRect(x: 0, y: MyScreenHeight , width: MyScreenWith, height: 300))
        view.addSubview(brushSettingView)
        brushSettingView.strokeWSlider.addTarget(self, action: #selector(SLBDrawDrawViewController.strokeWSliderClick(_:)), for: .valueChanged)
        self.drawDrawV.undo.addTarget(self, action: #selector(SLBDrawDrawViewController.undoClick), for: .touchUpInside)
        self.drawDrawV.redo.addTarget(self, action: #selector(SLBDrawDrawViewController.redoClick), for: .touchUpInside)

        // 设置画笔的颜色
        brushSettingView.strokeColorChangedBlock = {
            (color: UIColor) in
            self.drawDrawV.paintViewTool.strokeColor = color
            self.drawDrawV.paintViewTool.brush = SLBPencilBrush()
        }
        
        brushSettingView.doneBtn.addTarget(self, action: #selector(SLBDrawDrawViewController.doneClick), for: .touchUpInside)
        
        // 选择六个按钮的方法
        for indext in 0..<brushSettingView.addPreviewColor.btnArray.count{
            let btn = brushSettingView.addPreviewColor.btnArray[indext]
            btn.addTarget(self, action: #selector(SLBDrawDrawViewController.btnClick(_:)), for: .touchUpInside)
        }
    }
    
 
    //    MARK:- 全屏按钮
    func allScreenBtnClick(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected { // 全屏显示
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.drawDrawV.drawDrawTabbar.y = MyScreenHeight
                self.drawDrawV.drawDrawNav.y = -self.drawDrawV.drawDrawNav.height
                sender.y = sender.y + 60
                self.drawDrawV.undo.y =  self.drawDrawV.undo.y + 60
                self.drawDrawV.redo.y =  self.drawDrawV.redo.y + 60
                }, completion:nil)
        }else{   // 退出全屏
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
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
             UIView.animate(withDuration: 0.5, animations: { () -> Void in
                self.drawDrawV.drawDrawScrollView.zoomScale = 1
                
                self.drawDrawV.paintViewTool.alpha = 1
                
                }, completion: { (Bool) -> Void in
            })
        }
    }
    
    //    MARK:- 点击完成按钮
    func doneClick(){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.brushSettingView.frame = CGRect(x: 0, y: MyScreenHeight , width: MyScreenWith, height: 300)
            }, completion: nil)
    }
    
    //    MARK:- 颜色按钮点击方法
    func btnClick(_ sender: UIButton){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.brushSettingView.frame = CGRect(x: 0, y: MyScreenHeight , width: MyScreenWith, height: 300)
            }, completion: nil)
        drawDrawV.paintViewTool.brush = SLBPencilBrush()
        self.drawDrawV.paintViewTool.strokeColor = sender.backgroundColor!
        self.brushSettingView.backgroundPicker.setCurrentColor(sender.backgroundColor!)
        self.brushSettingView.previewColorView.backgroundColor = sender.backgroundColor!
    }
    
    
    func strokeWSliderClick(_ sender: UISlider){
        drawDrawV.paintViewTool.strokeWidth = CGFloat(sender.value)
        brushSettingView.drawBrushLowWH.text = String(format: "%.1f", sender.value)
    }
    
    func backButtonClick(){
        navigationController!.popToRootViewController(animated: true)
     }
    
    //    MARK:- 保存按钮
    func saveBtnClick(){
        let oldImage = self.drawDrawV.paintViewTool.takeImage()
        UIGraphicsBeginImageContext(view.size)
        oldImage.draw(in: CGRect(x: 0, y: 0, width: view.size.width, height: view.size.height))
        
        let newImge = imageBackGround
        newImge?.draw(in: CGRect(x: 0, y: 0, width: view.size.width, height: view.size.height))
        
        let nn = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(nn!, self, #selector(SLBDrawDrawViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafePointer<Float>) {
        if let err = error {
            let alert = UIAlertController(title: NSLocalizedString("failStr", comment: ""), message: err.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("commitStr", comment: ""), style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            
            
            let alert = UIAlertController(title: NSLocalizedString("tip", comment: ""), message: NSLocalizedString("saveSecusess", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("commitStr", comment: ""), style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    //    MARK:- 橡皮擦按钮
    func eraserBtnClick(_ sender: UIButton){
        drawDrawV.paintViewTool.brush = SLBEraserTool()
        sender.isEnabled = false
        drawDrawV.drawPencil.isEnabled = true
    }
    func drawPencilBtnClick(_ sender: UIButton){
        drawDrawV.paintViewTool.brush = SLBPencilBrush()
        sender.isEnabled = false
        drawDrawV.eraserBtn.isEnabled = true
    }
    
    // MARK:- 画笔设置
    func drawSettingBtnClick(){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.brushSettingView.frame = CGRect(x: 0, y: MyScreenHeight - 300 , width: MyScreenWith, height: 300)
            }, completion: nil)
        
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        scrollView.isScrollEnabled = false
        
        let offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width) ? (scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0
        let offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height) ? (scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0
        drawDrawV.paintViewTool.center = CGPoint(x: scrollView.contentSize.width/2 + offsetX,y: scrollView.contentSize.height/2 + offsetY);
        
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return drawDrawV.paintViewTool
        
    }
    
    
    
    
    
    
    
    
}
