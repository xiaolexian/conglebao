


//
//  SLBPaintViewTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/1/14.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit
/**  touch的状态  */
enum DrawingState {
    case Began, Moved, Ended
}


class SLBPaintViewTool: UIImageView {
      private var drawingState: DrawingState!
    var strokeWidth: CGFloat
    var strokeColor: UIColor
    var imageView:UIImageView!
    
    /**  画笔  */
    var brush: SLBBaseBrushTool!
    /**  保存当前的图形  */
    private var realImage: UIImage?
    var drawingStateChangeBlock:((stata: DrawingState)->())?
    
    override init(image: UIImage?) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 10
        super.init(image: image)
        userInteractionEnabled = true
        
        // 1.添加图层
        imageView = UIImageView(frame: CGRectMake(0, 0, MyScreenWith, MyScreenHeight))
        imageView.userInteractionEnabled = true
        imageView.image = UIImage(named: "HaiTun_00")
        addSubview(imageView)
        userInteractionEnabled = true
     }
    
    required init?(coder aDecoder: NSCoder) {
        self.strokeColor = UIColor.blackColor()
        self.strokeWidth = 10
        super.init(coder: aDecoder)
    }
    
    // 此处省略init方法与另外两个属性
     // MARK: - touches methods
     override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let brush = self.brush {
            brush.lastPoint = nil
            brush.beginPoint = touches.first?.locationInView(self)
            brush.endPoint = brush.beginPoint
            self.drawingState = .Began
            self.drawingImage()
            print("开始")
        }
     }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first?.locationInView(self)
            self.drawingState = .Moved
            self.drawingImage()
            print("移动")
         }
    }
    
    // MARK: 手势取消
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let brush = self.brush {
//            brush.endPoint = nil
            brush.endPoint = touches!.first?.locationInView(self)
            self.drawingState = .Ended
            self.drawingImage()
            undo()
            print("取消")
 
         }
    }
    // MARK: 手势结束
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = touches.first?.locationInView(self)
            self.drawingState = .Ended
            self.drawingImage()
            print("结束")
         }
    }
    
    
    
    // MARK: - drawing
    
    private func drawingImage() {
        if let brush = self.brush {
            
            if let drawingStateChangedBlock = self.drawingStateChangeBlock {
                drawingStateChangedBlock(stata:self.drawingState)
            }
            
             UIGraphicsBeginImageContext(self.bounds.size)
            
             let context = UIGraphicsGetCurrentContext()
            
            UIColor.clearColor().setFill()
            UIRectFill(self.bounds)
            CGContextSetLineCap(context!, CGLineCap.Round)
            CGContextSetLineWidth(context!, self.strokeWidth)
            CGContextSetStrokeColorWithColor(context!, self.strokeColor.CGColor)
            
             if let realImage = self.realImage {
                realImage.drawInRect(self.bounds)
            }
            
             brush.strokeWidth = self.strokeWidth
            brush.drawInContext(context!)
            CGContextStrokePath(context!)
            
             let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if self.drawingState == .Ended || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            UIGraphicsEndImageContext()
         
            // 用 Ended 事件代替原先的 Began 事件
            if self.drawingState == .Ended {
                self.boardUndoManager.addImage(self.image!)
            }
            
             self.image = previewImage;
             brush.lastPoint = brush.endPoint
        }
    }
    
    func takeImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        self.backgroundColor?.setFill()
        UIRectFill(self.bounds)
        self.image?.drawInRect(self.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func clearDraw(){
        realImage = nil
        self.image = realImage
     
    }
    
 
    // MARK:-用于撤销的代码
    private var boardUndoManager = DBUndoManager() // 缓存或Undo控制器
     private class DBUndoManager {
        class DBImageFault: UIImage {}  // 一个 Fault 对象，与 Core Data 中的 Fault 设计类似
        
        private static let INVALID_INDEX = -1
        private var images = [UIImage]()    // 图片栈
        private var index = INVALID_INDEX   // 一个指针，指向 images 中的某一张图
        
        var canUndo: Bool {
            get {
                return index != DBUndoManager.INVALID_INDEX
            }
        }
        
        var canRedo: Bool {
            get {
                return index + 1 < images.count
            }
        }
        
        func addImage(image: UIImage) {
            // 当往这个 Manager 中增加图片的时候，先把指针后面的图片全部清掉，
            // 这与我们之前在 drawingImage 方法中对 redoImages 的处理是一样的
            if index < images.count - 1 {
                images[index + 1 ... images.count - 1] = []
            }
            
            images.append(image)
            
            // 更新 index 的指向
            index = images.count - 1
            
            setNeedsCache()
        }
        
        func imageForUndo() -> UIImage? {
            if self.canUndo {
                index -= 1
                if self.canUndo == false {
                    return nil
                } else {
                    setNeedsCache()
                    return images[index]
                }
            } else {
                return nil
            }
        }
        
        func imageClear(){
            images = [UIImage]()
        }
        
        func imageForRedo() -> UIImage? {
            var image: UIImage? = nil
            if self.canRedo {
                index += 1
                image = images[index]
            }
            setNeedsCache()
            return image
        }
        
        // MARK: - Cache
        
        private static let cahcesLength = 3 // 在内存中保存图片的张数，以 index 为中心点计算：cahcesLength * 2 + 1
        private func setNeedsCache() {
            if images.count >= DBUndoManager.cahcesLength {
                let location = max(0, index - DBUndoManager.cahcesLength)
                let length = min(images.count - 1, index + DBUndoManager.cahcesLength)
                for i in location ... length {
                    autoreleasepool {
                        let image = images[i]
                        
                        if i > index - DBUndoManager.cahcesLength && i < index + DBUndoManager.cahcesLength {
                            setRealImage(image, forIndex: i) // 如果在缓存区域中，则从文件加载
                        } else {
                            setFaultImage(image, forIndex: i) // 如果不在缓存区域中，则置成 Fault 对象
                        }
                    }
                }
            }
        }
        
        private static var basePath: String = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        private func setFaultImage(image: UIImage, forIndex: Int) {
            if !image.isKindOfClass(DBImageFault.self) {
                let imagePath = (DBUndoManager.basePath as NSString).stringByAppendingPathComponent("\(forIndex)")
                UIImagePNGRepresentation(image)!.writeToFile(imagePath, atomically: false)
                images[forIndex] = DBImageFault()
            }
        }
        
        private func setRealImage(image: UIImage, forIndex: Int) {
            if image.isKindOfClass(DBImageFault.self) {
                let imagePath = (DBUndoManager.basePath as NSString).stringByAppendingPathComponent("\(forIndex)")
                images[forIndex] = UIImage(data: NSData(contentsOfFile: imagePath)!)!
            }
        }
    }
    var canUndo: Bool {
        get {
            return self.boardUndoManager.canUndo
        }
    }
    
    var canRedo: Bool {
        get {
            return self.boardUndoManager.canRedo
        }
    }
    
    // undo 和 redo 的逻辑都有所简化
    func undo() {
        if self.canUndo == false {
            return
        }
        
        self.image = self.boardUndoManager.imageForUndo()
        
        self.realImage = self.image
    }
    
    func clearImageArray(){
        self.boardUndoManager.imageClear()
    }
    
    func redo() {
        if self.canRedo == false {
            return
        }
        
        self.image = self.boardUndoManager.imageForRedo()
        
        self.realImage = self.image
    }
    
    
}
