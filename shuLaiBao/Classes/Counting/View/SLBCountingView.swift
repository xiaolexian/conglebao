//
//  SLBCountingView.swift
//  shuLaiBao
//
//  Created by liudeng on 16/2/15.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import UIKit

class SLBCountingView: UIView {
    let grapeBtnW:CGFloat = 191.5
    let grapeBtnH:CGFloat = 211
    var randomCount:Int!

   var grapeBtnArray:Array<UIImageView>!               // 葡萄数组按钮
    var backGroundImage:UIImageView!       // 背景图
    var bigTreeImage:UIImageView!          // 大树
    var smallTreeImage:UIImageView!        // 小树
    var flowerImage:UIImageView!           // 花
    var grassImage:UIImageView!            // 草
    var grapeImageOne:UIImageView!         // 第一串儿葡萄
    var grapeImageTwo:UIImageView!         // 第二串儿葡萄
    var grapeImageThree:UIImageView!       // 第三串儿葡萄
    var grapeImageFour:UIImageView!        // 第四串儿葡萄
    var grapeImageFive:UIImageView!        // 第五串儿葡萄
    var grapeImageSix:UIImageView!         // 第六串儿葡萄
    var grapeImageSeven:UIImageView!       // 第七串儿葡萄
    var grapeImageEight:UIImageView!       // 第八串儿葡萄
    var grapeImageNine:UIImageView!        // 第九串儿葡萄
    var grapeImageTen:UIImageView!         // 第十串儿葡萄
    var basket:UIImageView!                // 篮子
    var lightBasket:UIImageView!          // 高亮篮子
     var commitButton:UIButton!            // 确认按钮
    var redFoxImage:UIImageView!           // 狐狸
    var tipContent:UIImageView!            // 提示框
    var tipWord:UILabel!                   // 提示文字

     var backButton:UIButton!              // 返回按钮
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGrayColor()
        grapeBtnArray = [UIImageView]()
        
        // 背景图
        backGroundImage = UIImageView()
        backGroundImage.frame = CGRectMake(0, 0, MyScreenWith, MyScreenHeight)
        backGroundImage.image = UIImage(named: "counting_BG")
        addSubview(backGroundImage)
        
        // 大树
        bigTreeImage = UIImageView()
        bigTreeImage.image = UIImage(named: "counting_tring")
        bigTreeImage.frame = CGRectMake(-20, 5, MyScreenWith + 20, MyScreenHeight * 0.6)
        addSubview(bigTreeImage)
        
        // 花
        flowerImage = UIImageView()
        flowerImage.image = UIImage(named: "counting_flower")
        let flowerImageW:CGFloat = flowerImage.image!.size.width
        let flowerImageH:CGFloat = flowerImage.image!.size.height
        flowerImage.frame = CGRectMake(MyScreenWith - flowerImageW + 10 , bigTreeImage.maxY - flowerImageH + 30, flowerImageW + 10, flowerImageH + 10)
        addSubview(flowerImage)
        
        
        // 小树
        smallTreeImage = UIImageView()
        smallTreeImage.image = UIImage(named: "counting_tring")
        let smallTreeImageW:CGFloat = MyScreenWith - 20
        let smallTreeImageH:CGFloat = MyScreenHeight * 0.4
        smallTreeImage.frame = CGRectMake(0, bigTreeImage.maxY - smallTreeImageH + 60, smallTreeImageW, smallTreeImageH)
        smallTreeImage.transform = CGAffineTransformMakeScale(-1, 1)
        addSubview(smallTreeImage)
        
        // 小草
        grassImage = UIImageView()
        grassImage.image = UIImage(named: "counting_grass")
        let grassImageW:CGFloat = grassImage.image!.size.width
        let grassImageH:CGFloat = grassImage.image!.size.height
        grassImage.frame = CGRectMake(0, smallTreeImage.maxY - grassImageH, grassImageW + 20, grassImageH + 10)
        addSubview(grassImage)
        
        // 狐狸
        redFoxImage = UIImageView()
         redFoxImage.frame = CGRectMake(-20, MyScreenHeight - 180, 226, 180)
        redFoxImage.transform = CGAffineTransformMakeRotation(-0.2)
        addSubview(redFoxImage)
        
        // 提示框
        tipContent = UIImageView()
        tipContent.image = UIImage(named: "count_tip")
        tipContent.frame = CGRectMake(redFoxImage.maxX - 170, redFoxImage.y - 20, 111, 100)
        addSubview(tipContent)
        
        if deviceTypeIpone4(){
            redFoxImage.transform = CGAffineTransformMakeScale(0.8, 0.8)
            redFoxImage.y = MyScreenHeight - 150
            tipContent.transform = CGAffineTransformMakeScale(0.8, 0.8)
            tipContent.y = redFoxImage.y - 20
        }
        
        // 提示文字
        tipWord = UILabel()
        randomCount = myRandom(1, max: 10)
        let ineedStr = NSLocalizedString("ineedStr", comment: "")
        let bunchStr = NSLocalizedString("bunchStr", comment: "")
        tipWord.text = "\(ineedStr) \(randomCount) \(bunchStr)"
        tipWord.frame = CGRectMake(7, 18, tipContent.width + 10 , 20)
        tipWord.textAlignment = .Left
        tipWord.textColor = UIColor.whiteColor()
        tipWord.font = UIFont.boldSystemFontOfSize(17)
        tipWord.shadowColor = UIColor.blackColor()
        tipWord.shadowOffset = CGSizeMake(1.0, 1.0)
        tipContent.addSubview(tipWord)
        
        // 篮子
        basket = UIImageView()
        basket.image = UIImage(named: "empty_00")
        basket.frame = CGRectMake(MyScreenWith - basket.image!.size.width - 10, MyScreenHeight * 0.68, basket.image!.size.width, basket.image!.size.height)
        addSubview(basket)
        
        // 高亮篮子
        lightBasket = UIImageView()
        lightBasket.image = UIImage(named: "lightBasket")
        lightBasket.frame = basket.frame
        lightBasket.hidden = true
        addSubview(lightBasket)
   
        // 第六串儿葡萄
        grapeImageSix = UIImageView()
        addGrapeImage(0, y: smallTreeImage.y + smallTreeImage.height * 0.2, w: grapeBtnW * 0.41, h: grapeBtnH * 0.41, imageV: grapeImageSix)
        
        // 第八串儿葡萄
        grapeImageSeven = UIImageView()
        addGrapeImage(MyScreenWith * 0.42, y: smallTreeImage.y + smallTreeImage.height * 0.35, w: grapeBtnW * 0.3, h: grapeBtnH * 0.3, imageV: grapeImageSeven)
        
        // 第七串儿葡萄
        grapeImageEight = UIImageView()
        addGrapeImage(MyScreenWith * 0.16, y: smallTreeImage.y + smallTreeImage.height * 0.25, w: grapeBtnW * 0.47, h: grapeBtnH * 0.47, imageV: grapeImageEight)
        
        // 第九串儿葡萄
        grapeImageNine = UIImageView()
        addGrapeImage(MyScreenWith * 0.55, y: smallTreeImage.y + smallTreeImage.height * 0.18, w: grapeBtnW * 0.4, h: grapeBtnH * 0.4, imageV: grapeImageNine)
        
        // 第十串儿葡萄
        grapeImageTen = UIImageView()
        addGrapeImage(MyScreenWith * 0.72, y: smallTreeImage.y + smallTreeImage.height * 0.18, w: grapeBtnW * 0.3, h: grapeBtnH * 0.3, imageV: grapeImageTen)
        
        // 第一串儿葡萄
        grapeImageOne = UIImageView()
        addGrapeImage(0, y: bigTreeImage.x + bigTreeImage.height * 0.25, w: grapeBtnW * 0.4, h: grapeBtnH * 0.4, imageV: grapeImageOne)
        
        // 第三串儿葡萄
        grapeImageThree = UIImageView()
        addGrapeImage(MyScreenWith * 0.35, y: bigTreeImage.x + bigTreeImage.height * 0.3, w: grapeBtnW * 0.42, h: grapeBtnH * 0.42, imageV: grapeImageThree)
        
        // 第二串儿葡萄
        grapeImageTwo = UIImageView()
        addGrapeImage(MyScreenWith * 0.15, y: bigTreeImage.x + bigTreeImage.height * 0.25, w: grapeBtnW * 0.47, h: grapeBtnH * 0.47, imageV: grapeImageTwo)
        
        // 第四串儿葡萄
        grapeImageFour = UIImageView()
        addGrapeImage(MyScreenWith * 0.55, y: bigTreeImage.x + bigTreeImage.height * 0.27, w: grapeBtnW * 0.4, h: grapeBtnH * 0.4, imageV: grapeImageFour)
        
        // 第五串儿葡萄
        grapeImageFive = UIImageView()
        addGrapeImage(MyScreenWith * 0.72, y: bigTreeImage.x + bigTreeImage.height * 0.4, w: grapeBtnW * 0.3, h: grapeBtnH * 0.3, imageV: grapeImageFive)
        
        //返回按钮
        backButton = UIButton()
        backButton.frame = CGRectMake(10, 10, 33, 33)
//        backButton.titleLabel?.font = UIFont(name: "STHupo", size: 14)
//        backButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
//        backButton.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
//        backButton.setTitle(NSLocalizedString("backStr", comment: "备注"), forState: .Normal)
         backButton.setBackgroundImage(UIImage(named: "back_btn"), forState: .Normal)
         addSubview(backButton)
        
        // 确认按钮
        commitButton = UIButton()
        commitButton.frame = CGRectMake(MyScreenWith - 85 - 20, MyScreenHeight - 47 - 20, 95, 40)
        commitButton.setBackgroundImage( UIImage(named: "commitBtn_icon"), forState: .Normal)
        commitButton.setTitle(NSLocalizedString("commitStr", comment: ""), forState: .Normal)
        commitButton.titleLabel?.font = UIFont(name: "STHupo", size: 20)
        commitButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        commitButton.titleLabel?.shadowOffset = CGSizeMake(1.0, 1.0)
        addSubview(commitButton)
     
        
    }
    
    // 添加葡萄公用方法
    func addGrapeImage(x:CGFloat , y:CGFloat, w:CGFloat, h: CGFloat, imageV:UIImageView){
        imageV.userInteractionEnabled = true
        imageV.image = UIImage(named: "grape")
        imageV.frame = CGRectMake(x, y, w, h)
        addSubview(imageV)
        grapeBtnArray.append(imageV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
