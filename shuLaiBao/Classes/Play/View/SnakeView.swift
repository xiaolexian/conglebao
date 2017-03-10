//
//  SnakeView.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/13.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit


class SnakeView: UIView {
    
    let allQuestionCountLabel = UILabel()
    let residualQuestionCountLabel = UILabel()
    let rightQuestionCountLabel = UILabel()
    let wrongQuestionCountLabel = UILabel()
    let failQuestionCountLabel = UILabel()
    let getQuestionButton = UIButton()
    let bgView = UIImageView()
    let questionLabel = UILabel()
    let answerLabel = UILabel()
    let answerButton = UIButton()
    let playPlayBackGround = UIImageView()
    let pauseButton = UIButton()
    let PlayKuangImageView = UIImageView()
    let score = UIImageView()
    let residualImage = UIImageView()
    let playSign = UIImageView()
    let playGrass = UIImageView()
    let questionNum = UILabel()
    let getScore = UILabel()
    let qianJing = UIImageView()
    let nailIcon = UIImageView()
    let upRightNailIcon = UIImageView()
    let downLeftNailIcon = UIImageView()
    let downRightNailIcon = UIImageView()
    let qingWaIcon = UIImageView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
 
        //背景图片
        playPlayBackGround.frame = CGRectMake(0, 0, MyScreenWith, MyScreenHeight)
        playPlayBackGround.image = UIImage(named: "playPlayBg")
        addSubview(playPlayBackGround)
        
        // 暂停按钮Button
        pauseButton.setImage(UIImage(named: "play_Suspend"), forState: .Normal)
        pauseButton.frame = CGRectMake(myScreenSize.width - 25 - (pauseButton.currentImage?.size.width)!, 30, (pauseButton.currentImage?.size.width)! + 20, (pauseButton.currentImage?.size.height)!)
        pauseButton.titleLabel?.font = UIFont.systemFontOfSize(14)
         pauseButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        addSubview(pauseButton)
        
        // 题目总数量Label
        allQuestionCountLabel.frame = CGRectMake(20, 50, myScreenSize.width / 2 - 20, 20)
        allQuestionCountLabel.font = UIFont.systemFontOfSize(13)
//        addSubview(allQuestionCountLabel)
        
        // 已答错题目数量Label
        wrongQuestionCountLabel.frame = CGRectMake(rightQuestionCountLabel.maxX, rightQuestionCountLabel.y, rightQuestionCountLabel.width, rightQuestionCountLabel.height)
        wrongQuestionCountLabel.font = allQuestionCountLabel.font
//        addSubview(wrongQuestionCountLabel)
        
        // 已失败题目数量Label
        failQuestionCountLabel.frame = CGRectMake(wrongQuestionCountLabel.maxX, rightQuestionCountLabel.y, rightQuestionCountLabel.width, rightQuestionCountLabel.height)
        failQuestionCountLabel.font = allQuestionCountLabel.font
//        addSubview(failQuestionCountLabel)
        
        // 木牌子
        playSign.image = UIImage(named: "Play_sign")
        playSign.frame = CGRectMakeWithCenter(MyScreenWith * 0.5 + 10, MyScreenHeight * 0.12, playSign.image!.size.width, playSign.image!.size.height)
        addSubview(playSign)
        
        // 获取题目按钮Button
        getQuestionButton.frame = playSign.frame
        getQuestionButton.setBackgroundImage(UIImage(named: "getQustion_nor"), forState: .Normal)
        getQuestionButton.setBackgroundImage(UIImage(named: "getQustion_nor"), forState: .Highlighted)
        getQuestionButton.setBackgroundImage(UIImage(named: "getQustion_dis"), forState: .Disabled)
        addSubview(getQuestionButton)
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        getQuestionButton.layer.anchorPoint = CGPointMake(0.5, 0.5)
        animation.autoreverses = true
        animation.fromValue = 1.0
        animation.repeatCount = 10000000
        animation.toValue = 1.1
        animation.duration = 1.0
        getQuestionButton.layer.addAnimation(animation, forKey: "scale")
 
        
        // 背景View
          bgView.frame = CGRectMakeWithCenter(MyScreenWith * 0.5, MyScreenHeight * 0.5, myScreenSize.width - 50, myScreenSize.width - 50)
        if deviceTypeIpone5s() {bgView.centerY = MyScreenHeight * 0.55}
         bgView.centerX = myScreenSize.width / 2
        bgView.image = UIImage(named: "PlaySceen")
        addSubview(bgView)
        
        // 背景View
        PlayKuangImageView.frame = CGRectMakeWithCenter(bgView.centerX, bgView.centerY, bgView.width + 20, bgView.height + 20)
         PlayKuangImageView.image = UIImage.resizedImageWithName("Play_Kuang")
        addSubview(PlayKuangImageView)
        
        // 题目Label
        questionLabel.frame = CGRectMake(0, bgView.maxY + 20, myScreenSize.width, 20)
        questionLabel.textAlignment = .Center
        addSubview(questionLabel)
        
        // 答案Label
        answerLabel.frame = CGRectMake(0, questionLabel.maxY + 20, myScreenSize.width * 2 / 3, 20)
        answerLabel.textAlignment = .Right
        addSubview(answerLabel)
        
        // 确定按钮Button
        answerButton.frame = CGRectMake(MyScreenWith - 103 - 20, MyScreenHeight - 47 - 35, 103, 47)
         answerButton.setBackgroundImage( UIImage(named: "commitBtn_icon"), forState: .Normal)
        answerButton.setTitle(NSLocalizedString("commitStr", comment: ""), forState: .Normal)
        answerButton.titleLabel?.font = UIFont(name: "STHupo", size: 25)
        answerButton.setTitleShadowColor(UIColor.blackColor(), forState: .Normal)
        answerButton.titleLabel?.shadowOffset = CGSizeMake(1.0, 1.0)
         addSubview(answerButton)
        
        
        // 得分图片
        score.image = UIImage(named: "Play_scr")
        score.frame = CGRectMake(10, 25, (score.image?.size.width)!, (score.image?.size.height)!)
        addSubview(score)
        
        // 得分label
        getScore.frame = CGRectMake(10, 5, score.width, 20)
        getScore.centerX = score.centerX
        getScore.text = NSLocalizedString("scoreStr", comment: "")
        getScore.alpha = 0.8
        getScore.textAlignment = .Center
        getScore.font = UIFont.systemFontOfSize(13)
        getScore.textColor = UIColor.whiteColor()
        getScore.shadowColor = UIColor.blackColor()
        getScore.shadowOffset = CGSizeMake(1.0, 1.0)
        addSubview(getScore)
        
        // 添加图钉
        nailIcon.image = UIImage(named: "nail_icon")
        nailIcon.frame = CGRectMake(bgView.x - 25, bgView.y - 25, nailIcon.image!.size.width, nailIcon.image!.size.height)
        addSubview(nailIcon)
        
        if !deviceTypeIpone4() { // 如果是ipone4或4s,上边右边的图钉不显示
             upRightNailIcon.image = UIImage(named: "nail_icon")
            upRightNailIcon.frame = CGRectMake(bgView.maxX - 15, bgView.y - 25, nailIcon.image!.size.width, nailIcon.image!.size.height)
            addSubview(upRightNailIcon)
        }else{
             pauseButton.y = 15
        }
        
        downLeftNailIcon.image = UIImage(named: "nail_icon")
        downLeftNailIcon.frame = CGRectMake(bgView.x - 25, bgView.maxY - 20, nailIcon.image!.size.width, nailIcon.image!.size.height)
        addSubview(downLeftNailIcon)
        
        downRightNailIcon.image = UIImage(named: "nail_icon")
        downRightNailIcon.frame = CGRectMake(bgView.maxX - 15, bgView.maxY - 20, nailIcon.image!.size.width, nailIcon.image!.size.height)
        addSubview(downRightNailIcon)
        
        // 题数label
        questionNum.frame = CGRectMake(pauseButton.x , pauseButton.maxY + 5, pauseButton.width + 10, 20)
        questionNum.text = NSLocalizedString("numberOfQuestions", comment: "")
        questionNum.alpha = 0.8
        questionNum.font = UIFont.systemFontOfSize(13)
        questionNum.textColor = UIColor.whiteColor()
        questionNum.shadowColor = UIColor.blackColor()
        questionNum.shadowOffset = CGSizeMake(1.0, 1.0)
        addSubview(questionNum)
        
        // 题数
        residualImage.image = UIImage(named: "Play_Moves")
        residualImage.frame = CGRectMake(MyScreenWith - 10 - score.width, questionNum.maxY, (residualImage.image?.size.width)!, (residualImage.image?.size.height)!)
        addSubview(residualImage)
        
        // 已答对题目数量Label
        rightQuestionCountLabel.frame = CGRectMake(score.x, score.y, score.width, score.height)
        rightQuestionCountLabel.font = UIFont.boldSystemFontOfSize(20)
        rightQuestionCountLabel.shadowColor = UIColor.grayColor()
        rightQuestionCountLabel.shadowOffset = CGSizeMake(1.0, 2.0)
        rightQuestionCountLabel.textColor = UIColor.whiteColor()
        rightQuestionCountLabel.textAlignment = .Center
        addSubview(rightQuestionCountLabel)
        
        // 剩余题目数量Label
        residualQuestionCountLabel.frame = CGRectMake(residualImage.x, residualImage.y, residualImage.width, residualImage.height)
        residualQuestionCountLabel.font = rightQuestionCountLabel.font
        residualQuestionCountLabel.shadowColor = UIColor.grayColor()
        residualQuestionCountLabel.shadowOffset = CGSizeMake(1.0, 2.0)
        residualQuestionCountLabel.textColor = UIColor.whiteColor()
        residualQuestionCountLabel.textAlignment = .Center
        addSubview(residualQuestionCountLabel)
        
        // 青蛙
        qingWaIcon.image = UIImage(named: "qingWa_00")
        qingWaIcon.frame = CGRectMake(-20, MyScreenHeight - qingWaIcon.image!.size.height - 100, qingWaIcon.image!.size.width + 100, qingWaIcon.image!.size.height + 100)
        addSubview(qingWaIcon)
         
        // 草
        playGrass.image = UIImage(named: "play_grass")
        playGrass.frame = CGRectMake(0, 0, MyScreenWith, playGrass.image!.size.height)
        addSubview(playGrass)
        
        // 前景草
        qianJing.frame = CGRectMake(0, MyScreenHeight - 60, MyScreenWith, 60)
        qianJing.image = UIImage(named: "qianjing_01")
        addSubview(qianJing)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
