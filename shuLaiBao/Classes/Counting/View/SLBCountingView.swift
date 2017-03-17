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
        backgroundColor = UIColor.lightGray
        grapeBtnArray = [UIImageView]()
        
        // 背景图
        backGroundImage = UIImageView()
        backGroundImage.frame = CGRect(x: 0, y: 0, width: MyScreenWith, height: MyScreenHeight)
        backGroundImage.image = UIImage(named: "counting_BG")
        addSubview(backGroundImage)
        
        // 大树
        bigTreeImage = UIImageView()
        bigTreeImage.image = UIImage(named: "counting_tring")
        bigTreeImage.frame = CGRect(x: -20, y: 5, width: MyScreenWith + 20, height: MyScreenHeight * 0.6)
        addSubview(bigTreeImage)
        
        // 花
        flowerImage = UIImageView()
        flowerImage.image = UIImage(named: "counting_flower")
        let flowerImageW:CGFloat = flowerImage.image!.size.width
        let flowerImageH:CGFloat = flowerImage.image!.size.height
        flowerImage.frame = CGRect(x: MyScreenWith - flowerImageW + 10 , y: bigTreeImage.maxY - flowerImageH + 30, width: flowerImageW + 10, height: flowerImageH + 10)
        addSubview(flowerImage)
        
        
        // 小树
        smallTreeImage = UIImageView()
        smallTreeImage.image = UIImage(named: "counting_tring")
        let smallTreeImageW:CGFloat = MyScreenWith - 20
        let smallTreeImageH:CGFloat = MyScreenHeight * 0.4
        smallTreeImage.frame = CGRect(x: 0, y: bigTreeImage.maxY - smallTreeImageH + 60, width: smallTreeImageW, height: smallTreeImageH)
        smallTreeImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        addSubview(smallTreeImage)
        
        // 小草
        grassImage = UIImageView()
        grassImage.image = UIImage(named: "counting_grass")
        let grassImageW:CGFloat = grassImage.image!.size.width
        let grassImageH:CGFloat = grassImage.image!.size.height
        grassImage.frame = CGRect(x: 0, y: smallTreeImage.maxY - grassImageH, width: grassImageW + 20, height: grassImageH + 10)
        addSubview(grassImage)
        
        // 狐狸
        redFoxImage = UIImageView()
         redFoxImage.frame = CGRect(x: -20, y: MyScreenHeight - 180, width: 226, height: 180)
        redFoxImage.transform = CGAffineTransform(rotationAngle: -0.2)
        addSubview(redFoxImage)
        
        // 提示框
        tipContent = UIImageView()
        tipContent.image = UIImage(named: "count_tip")
        tipContent.frame = CGRect(x: redFoxImage.maxX - 170, y: redFoxImage.y - 20, width: 111, height: 100)
        addSubview(tipContent)
        
        if deviceTypeIpone4(){
            redFoxImage.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            redFoxImage.y = MyScreenHeight - 150
            tipContent.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            tipContent.y = redFoxImage.y - 20
        }
        
        // 提示文字
        tipWord = UILabel()
        randomCount = myRandom(1, max: 10)
        let ineedStr = NSLocalizedString("ineedStr", comment: "")
        let bunchStr = NSLocalizedString("bunchStr", comment: "")
        tipWord.text = "\(ineedStr) \(randomCount!) \(bunchStr)"
        tipWord.frame = CGRect(x: 7, y: 18, width: tipContent.width + 10 , height: 20)
        tipWord.textAlignment = .left
        tipWord.textColor = UIColor.white
        tipWord.font = UIFont.boldSystemFont(ofSize: 17)
        tipWord.shadowColor = UIColor.black
        tipWord.shadowOffset = CGSize(width: 1.0, height: 1.0)
        tipContent.addSubview(tipWord)
        
        // 篮子
        basket = UIImageView()
        basket.image = UIImage(named: "empty_00")
        basket.frame = CGRect(x: MyScreenWith - basket.image!.size.width - 10, y: MyScreenHeight * 0.68, width: basket.image!.size.width, height: basket.image!.size.height)
        addSubview(basket)
        
        // 高亮篮子
        lightBasket = UIImageView()
        lightBasket.image = UIImage(named: "lightBasket")
        lightBasket.frame = basket.frame
        lightBasket.isHidden = true
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
        backButton.frame = CGRect(x: 10, y: 10, width: 33, height: 33)
//        backButton.titleLabel?.font = UIFont(name: "STHupo", size: 14)
//        backButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
//        backButton.titleLabel?.shadowOffset = CGSizeMake(0.5, 1.0)
//        backButton.setTitle(NSLocalizedString("backStr", comment: "备注"), forState: .Normal)
         backButton.setBackgroundImage(UIImage(named: "back_btn"), for: UIControlState())
         addSubview(backButton)
        
        // 确认按钮
        commitButton = UIButton()
        commitButton.frame = CGRect(x: MyScreenWith - 85 - 20, y: MyScreenHeight - 47 - 20, width: 95, height: 40)
        commitButton.setBackgroundImage( UIImage(named: "commitBtn_icon"), for: UIControlState())
        commitButton.setTitle(NSLocalizedString("commitStr", comment: ""), for: UIControlState())
        commitButton.titleLabel?.font = UIFont(name: "STHupo", size: 20)
        commitButton.setTitleShadowColor(UIColor.black, for: UIControlState())
        commitButton.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 1.0)
        addSubview(commitButton)
     
        
    }
    
    // 添加葡萄公用方法
    func addGrapeImage(_ x:CGFloat , y:CGFloat, w:CGFloat, h: CGFloat, imageV:UIImageView){
        imageV.isUserInteractionEnabled = true
        imageV.image = UIImage(named: "grape")
        imageV.frame = CGRect(x: x, y: y, width: w, height: h)
        addSubview(imageV)
        grapeBtnArray.append(imageV)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
