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
        backgroundColor = UIColor.white
 
        //背景图片
        playPlayBackGround.frame = CGRect(x: 0, y: 0, width: MyScreenWith, height: MyScreenHeight)
        playPlayBackGround.image = UIImage(named: "playPlayBg")
        addSubview(playPlayBackGround)
        
        // 暂停按钮Button
        pauseButton.setImage(UIImage(named: "play_Suspend"), for: UIControlState())
        pauseButton.frame = CGRect(x: myScreenSize.width - 25 - (pauseButton.currentImage?.size.width)!, y: 30, width: (pauseButton.currentImage?.size.width)! + 20, height: (pauseButton.currentImage?.size.height)!)
        pauseButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
         pauseButton.setTitleColor(UIColor.black, for: UIControlState())
        addSubview(pauseButton)
        
        // 题目总数量Label
        allQuestionCountLabel.frame = CGRect(x: 20, y: 50, width: myScreenSize.width / 2 - 20, height: 20)
        allQuestionCountLabel.font = UIFont.systemFont(ofSize: 13)
//        addSubview(allQuestionCountLabel)
        
        // 已答错题目数量Label
        wrongQuestionCountLabel.frame = CGRect(x: rightQuestionCountLabel.maxX, y: rightQuestionCountLabel.y, width: rightQuestionCountLabel.width, height: rightQuestionCountLabel.height)
        wrongQuestionCountLabel.font = allQuestionCountLabel.font
//        addSubview(wrongQuestionCountLabel)
        
        // 已失败题目数量Label
        failQuestionCountLabel.frame = CGRect(x: wrongQuestionCountLabel.maxX, y: rightQuestionCountLabel.y, width: rightQuestionCountLabel.width, height: rightQuestionCountLabel.height)
        failQuestionCountLabel.font = allQuestionCountLabel.font
//        addSubview(failQuestionCountLabel)
        
        // 木牌子
        playSign.image = UIImage(named: "Play_sign")
        playSign.frame = CGRectMakeWithCenter(MyScreenWith * 0.5 + 10, MyScreenHeight * 0.12, playSign.image!.size.width, playSign.image!.size.height)
        addSubview(playSign)
        
        // 获取题目按钮Button
        getQuestionButton.frame = playSign.frame
        getQuestionButton.setBackgroundImage(UIImage(named: "getQustion_nor"), for: UIControlState())
        getQuestionButton.setBackgroundImage(UIImage(named: "getQustion_nor"), for: .highlighted)
        getQuestionButton.setBackgroundImage(UIImage(named: "getQustion_dis"), for: .disabled)
        addSubview(getQuestionButton)
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        getQuestionButton.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        animation.autoreverses = true
        animation.fromValue = 1.0
        animation.repeatCount = 10000000
        animation.toValue = 1.1
        animation.duration = 1.0
        getQuestionButton.layer.add(animation, forKey: "scale")
 
        
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
        questionLabel.frame = CGRect(x: 0, y: bgView.maxY + 20, width: myScreenSize.width, height: 20)
        questionLabel.textAlignment = .center
        addSubview(questionLabel)
        
        // 答案Label
        answerLabel.frame = CGRect(x: 0, y: questionLabel.maxY + 20, width: myScreenSize.width * 2 / 3, height: 20)
        answerLabel.textAlignment = .right
        addSubview(answerLabel)
        
        // 确定按钮Button
        answerButton.frame = CGRect(x: MyScreenWith - 103 - 20, y: MyScreenHeight - 47 - 35, width: 103, height: 47)
         answerButton.setBackgroundImage( UIImage(named: "commitBtn_icon"), for: UIControlState())
        answerButton.setTitle(NSLocalizedString("commitStr", comment: ""), for: UIControlState())
        answerButton.titleLabel?.font = UIFont(name: "STHupo", size: 25)
        answerButton.setTitleShadowColor(UIColor.black, for: UIControlState())
        answerButton.titleLabel?.shadowOffset = CGSize(width: 1.0, height: 1.0)
         addSubview(answerButton)
        
        
        // 得分图片
        score.image = UIImage(named: "Play_scr")
        score.frame = CGRect(x: 10, y: 25, width: (score.image?.size.width)!, height: (score.image?.size.height)!)
        addSubview(score)
        
        // 得分label
        getScore.frame = CGRect(x: 10, y: 5, width: score.width, height: 20)
        getScore.centerX = score.centerX
        getScore.text = NSLocalizedString("scoreStr", comment: "")
        getScore.alpha = 0.8
        getScore.textAlignment = .center
        getScore.font = UIFont.systemFont(ofSize: 13)
        getScore.textColor = UIColor.white
        getScore.shadowColor = UIColor.black
        getScore.shadowOffset = CGSize(width: 1.0, height: 1.0)
        addSubview(getScore)
        
        // 添加图钉
        nailIcon.image = UIImage(named: "nail_icon")
        nailIcon.frame = CGRect(x: bgView.x - 25, y: bgView.y - 25, width: nailIcon.image!.size.width, height: nailIcon.image!.size.height)
        addSubview(nailIcon)
        
        if !deviceTypeIpone4() { // 如果是ipone4或4s,上边右边的图钉不显示
             upRightNailIcon.image = UIImage(named: "nail_icon")
            upRightNailIcon.frame = CGRect(x: bgView.maxX - 15, y: bgView.y - 25, width: nailIcon.image!.size.width, height: nailIcon.image!.size.height)
            addSubview(upRightNailIcon)
        }else{
             pauseButton.y = 15
        }
        
        downLeftNailIcon.image = UIImage(named: "nail_icon")
        downLeftNailIcon.frame = CGRect(x: bgView.x - 25, y: bgView.maxY - 20, width: nailIcon.image!.size.width, height: nailIcon.image!.size.height)
        addSubview(downLeftNailIcon)
        
        downRightNailIcon.image = UIImage(named: "nail_icon")
        downRightNailIcon.frame = CGRect(x: bgView.maxX - 15, y: bgView.maxY - 20, width: nailIcon.image!.size.width, height: nailIcon.image!.size.height)
        addSubview(downRightNailIcon)
        
        // 题数label
        questionNum.frame = CGRect(x: pauseButton.x , y: pauseButton.maxY + 5, width: pauseButton.width + 10, height: 20)
        questionNum.text = NSLocalizedString("numberOfQuestions", comment: "")
        questionNum.alpha = 0.8
        questionNum.font = UIFont.systemFont(ofSize: 13)
        questionNum.textColor = UIColor.white
        questionNum.shadowColor = UIColor.black
        questionNum.shadowOffset = CGSize(width: 1.0, height: 1.0)
        addSubview(questionNum)
        
        // 题数
        residualImage.image = UIImage(named: "Play_Moves")
        residualImage.frame = CGRect(x: MyScreenWith - 10 - score.width, y: questionNum.maxY, width: (residualImage.image?.size.width)!, height: (residualImage.image?.size.height)!)
        addSubview(residualImage)
        
        // 已答对题目数量Label
        rightQuestionCountLabel.frame = CGRect(x: score.x, y: score.y, width: score.width, height: score.height)
        rightQuestionCountLabel.font = UIFont.boldSystemFont(ofSize: 20)
        rightQuestionCountLabel.shadowColor = UIColor.gray
        rightQuestionCountLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        rightQuestionCountLabel.textColor = UIColor.white
        rightQuestionCountLabel.textAlignment = .center
        addSubview(rightQuestionCountLabel)
        
        // 剩余题目数量Label
        residualQuestionCountLabel.frame = CGRect(x: residualImage.x, y: residualImage.y, width: residualImage.width, height: residualImage.height)
        residualQuestionCountLabel.font = rightQuestionCountLabel.font
        residualQuestionCountLabel.shadowColor = UIColor.gray
        residualQuestionCountLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        residualQuestionCountLabel.textColor = UIColor.white
        residualQuestionCountLabel.textAlignment = .center
        addSubview(residualQuestionCountLabel)
        
        // 青蛙
        qingWaIcon.image = UIImage(named: "qingWa_00")
        qingWaIcon.frame = CGRect(x: -20, y: MyScreenHeight - qingWaIcon.image!.size.height - 100, width: qingWaIcon.image!.size.width + 100, height: qingWaIcon.image!.size.height + 100)
        addSubview(qingWaIcon)
         
        // 草
        playGrass.image = UIImage(named: "play_grass")
        playGrass.frame = CGRect(x: 0, y: 0, width: MyScreenWith, height: playGrass.image!.size.height)
        addSubview(playGrass)
        
        // 前景草
        qianJing.frame = CGRect(x: 0, y: MyScreenHeight - 60, width: MyScreenWith, height: 60)
        qianJing.image = UIImage(named: "qianjing_01")
        addSubview(qianJing)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
