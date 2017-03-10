//
//  SnakeViewController.swift
//  SnakeSwift
//
//  Created by liangli on 16/1/13.
//  Copyright © 2016年 liangli. All rights reserved.
//

import UIKit

enum Direction: Int {
    case Up = -1    // -1 << 0
    case Down = 1   //  1 << 0
    case Left = -2  // -1 << 1
    case Right = 2  //  1 << 1
}

class SnakeViewController: UIViewController, UIGestureRecognizerDelegate, MyPopViewDelegate, SnakeAlertViewDelegate, SLBPauseAlertViewDelegate {
    
   internal var isPrimaryBtnClick:Bool?                     // 初级按钮
   internal var isMidBtnClick:Bool?                         // 中级按钮
   internal var isHightBtnClick:Bool?                       // 高级按钮
     
    var questionString:String!
    var allQuestionCountLabel: UILabel!
    var residualQuestionCountLabel: UILabel!
    var rightQuestionCountLabel: UILabel!
    var wrongQuestionCountLabel: UILabel!
    var failQuestionCountLabel: UILabel!
    var qingWaIcon: UIImageView!
    var getQuestionButton: UIButton!
    var bgView: UIView!
    var snakeView: SnakeView!
    var questionLabel: UILabel!
    var answerLabel: UILabel!
    var answerButton: UIButton!
    var pauseButton: UIButton!
    var colNum: Int!                            // 最大列数
    var rowNum: Int!                            // 最大行数
    var timeInterval: Double!                   // 每帧时间间隔
    var blockSize: CGSize!
    var timer: NSTimer?
    var snakeBlockArr: Array<SnakeBlock>!
    var isGameStar:Bool!
    private var direction: Direction! {
        willSet {
            if snakeBlockArr.count != 0 {
                let headBlock: HeadBlock = (snakeBlockArr.last as? HeadBlock)!
                headBlock.direction = newValue
            }
        }
    }
    var bonusBlock: BonusBlock!
    var resultNum: Int!                         // 题目答案
    var allQuestionCount: Int! {                // 题目总数量
        willSet {
            allQuestionCountLabel.text = "题目总数量：\(newValue)"
        }
    }
    var residualQuestionCount: Int! {           // 剩余题目数量
        willSet {
            residualQuestionCountLabel.text = "\(newValue)"
        }
    }
    var rightQuestionCount: Int! {              // 已答对题目数量
        willSet {
            rightQuestionCountLabel.text = "\(newValue)"
        }
    }
    var wrongQuestionCount: Int! {              // 已答错题目数量
        willSet {
            wrongQuestionCountLabel.text = "已答错：\(newValue)"
        }
    }
    var failQuestionCount: Int! {               // 已失败题目数量
        willSet {
            failQuestionCountLabel.text = "已失败：\(newValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化视图
        setupView()
        
        // 初始化数据
        setupData()
        
        self.isGameStar = false
    }
    
 
    
    // MARK: - 初始化视图
    func setupView() {
        snakeView = SnakeView(frame: view.bounds)
        view.addSubview(snakeView)
        
        // 暂停按钮Button
        pauseButton = snakeView.pauseButton
        pauseButton.addTarget(self, action: #selector(SnakeViewController.pauseButtonClick(_:)), forControlEvents: .TouchUpInside)
        
        // 题目总数量Label
        allQuestionCountLabel = snakeView.allQuestionCountLabel
        
        // 剩余题目数量Label
        residualQuestionCountLabel = snakeView.residualQuestionCountLabel
        
        // 已答对题目数量Label
        rightQuestionCountLabel = snakeView.rightQuestionCountLabel
        
        // 已答错题目数量Label
        wrongQuestionCountLabel = snakeView.wrongQuestionCountLabel
        
        // 已失败题目数量Label
        failQuestionCountLabel = snakeView.failQuestionCountLabel
        
        // 青蛙
        qingWaIcon = snakeView.qingWaIcon
        
        // 获取题目按钮Button
        getQuestionButton = snakeView.getQuestionButton
        getQuestionButton.addTarget(self, action: #selector(SnakeViewController.getQuestionButotnClick), forControlEvents: .TouchUpInside)
        
        // 青蛙动画
        imageAnimation("qingWa_0", imageNumber: 6, RepeatCount: 0, imageViews: qingWaIcon, duration: 0.15)
        
        // 背景View
        bgView = snakeView.bgView
        let bgViewGesture = UITapGestureRecognizer()
        bgViewGesture.delegate = self
        bgView.addGestureRecognizer(bgViewGesture)
        bgView.userInteractionEnabled = false
        
        // 题目Label
        questionLabel = snakeView.questionLabel
        
        // 答案Label
        answerLabel = snakeView.answerLabel
        
        // 确定按钮Button
        answerButton = snakeView.answerButton
        answerButton.hidden = true
        answerButton.addTarget(self, action: #selector(SnakeViewController.answerButtonClick), forControlEvents: .TouchUpInside)
    }
    
    // MARK: - 初始化数据
    func setupData() {
        colNum = 10
        rowNum = 10
        let blockWH = bgView.width / CGFloat(colNum)
        blockSize = CGSizeMake(blockWH, blockWH)
        
        if isPrimaryBtnClick == true{
            print("初级")
            timeInterval = 0.4
        }else if isMidBtnClick == true{
             print("中级")
            timeInterval = 0.3
        }else if isHightBtnClick == true{
             print("高级")
            timeInterval = 0.23
        }
    
        
        allQuestionCount = 10
        residualQuestionCount = allQuestionCount
        rightQuestionCount = 0
        wrongQuestionCount = 0
        failQuestionCount = 0
    }
    
    // MARK: - 按钮点击事件
    // 暂停按钮点击
    func pauseButtonClick(sender: UIButton) {
        let pausePopView = SLBPauseAlertView()
        pausePopView.frame = view.bounds
        pausePopView.delegate = self
        view.addSubview(pausePopView)
        pausePopView.questionsLabel.text = questionString
        
        
        if getQuestionButton.enabled  {
            print("f" )
        }else{
            print("g")
            isGameStar = false
            gameStop()
        }
 
    }
    
//    MARK:- 点击基础和放弃按钮
    func didClickContinueAndGiveUpClickButton(didClickContinueAndGiveUpButton button: UIButton) {
        
        
        if button.tag == 10{// 继续按钮
            if getQuestionButton.enabled  {
                print("f" )
            }else{
                print("g")
                gameContinue()
                isGameStar = true

            }
         }else if button.tag == 20{// 放弃按钮
            navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    // 获取题目按钮点击
    func getQuestionButotnClick() {
        let popView = MyPopView(frame: view.bounds)
        if isPrimaryBtnClick == true{
            popView.numbers(10)
            print("初级级")

        }else if isMidBtnClick == true{
            print("中级级")

            popView.numbers(15)

        }else if isHightBtnClick == true{
            print("高级")
            popView.numbers(20)
         }

         view.addSubview(popView)
        popView.delegate = self
        getQuestionButton.enabled = false
        getQuestionButton.layer.removeAllAnimations()
        
    }
    
    // 确定按钮点击
    func answerButtonClick() {
        residualQuestionCount = residualQuestionCount - 1
        let alertView = SnakeAlertView()
        alertView.frame = view.bounds
        alertView.delegate = self
        if snakeBlockArr.count - 1 == resultNum {
            // 回答正确
            rightQuestionCount = rightQuestionCount + 1
            alertView.contentText = NSLocalizedString("congratulationStr", comment: "")
            isGameStar = false
        } else {
            // 回答错误
            wrongQuestionCount = wrongQuestionCount + 1
            let wrongStr = NSLocalizedString("sorryWrongStr", comment: "")
            alertView.contentText = "\(wrongStr)  \(resultNum)"
            isGameStar = false
        }
        if residualQuestionCount == 0 {
            gameWin()
            isGameStar = false
        } else {
            view.addSubview(alertView)
        }
        gameStop()
    }
    
    // MARK: - 游戏开始
    func gameStart() {
        bgView.userInteractionEnabled = true
        answerButton.hidden = false
        isGameStar = true

        // 清空数据和计时器
        snakeBlockArr = [SnakeBlock]()
        bgView.subviews.forEach { (subview) -> () in
            subview.removeFromSuperview()
        }
        timer?.invalidate()
        
        // 初始化
        let firstBlockCol = myRandom(colNum / 2)
        let firstBlockRow = myRandom(rowNum - 1)
        let firstPosition = PositionMake(firstBlockCol, firstBlockRow)
         let firstBlock = HeadBlock(position: firstPosition, size: blockSize)
         bgView.addSubview(firstBlock)
         snakeBlockArr.append(firstBlock)
         addNewRandomBlock()
        direction = Direction.Right
        
        // 加入计时器
        timer = NSTimer(timeInterval: timeInterval, target: self, selector: #selector(SnakeViewController.everyFrameAction), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    // MARK: - 每帧事件
    func everyFrameAction() {
        bgView.userInteractionEnabled = true
        let headBlock = snakeBlockArr.last!
        let tailBlock = snakeBlockArr[0]
        let newPosition = PositionMake(headBlock.position.col + (direction.rawValue & -1) / 2, (headBlock.position.row) + (direction.rawValue & -1) % 2)
        if isReachWall(newPosition) || isReachSelf(newPosition) {
            // 撞死
            gameOver()
            isGameStar = false    // 撞死了获得焦点的时候不继续
        } else if PositionEqualToPosition(newPosition, bonusBlock.position) {
            // 吃到奖励
            bonusBlock.removeFromSuperview()
            let headBodyBlock = headBlock as! HeadBlock
             let newBodyBlock = BodyBlock(position: headBlock.position, size: blockSize)
            newBodyBlock.direction = headBodyBlock.direction
            bgView.addSubview(newBodyBlock)
            headBlock.position = newPosition
            snakeBlockArr.insert(newBodyBlock, atIndex: snakeBlockArr.count - 1)
            addNewRandomBlock()
            
            // 弹出当前数字
            let sumNumLabel = UILabel()
            sumNumLabel.frame = bgView.frame
            sumNumLabel.text = "\(snakeBlockArr.count - 1)"
            sumNumLabel.font = UIFont.boldSystemFontOfSize(100)
            sumNumLabel.textColor = UIColor.whiteColor()
            sumNumLabel.shadowColor = UIColor.blackColor()
            sumNumLabel.shadowOffset = CGSizeMake(1.0, 1.0)
            sumNumLabel.textAlignment = .Center
            sumNumLabel.transform = CGAffineTransformMakeScale(0.1, 0.1)
            view.addSubview(sumNumLabel)
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                sumNumLabel.transform = CGAffineTransformMakeScale(1, 1)
                }, completion: { (Bool) -> Void in
                    sumNumLabel.removeFromSuperview()
            })
            
            
        } else {
            // 正常进行
            let headBodyBlock = headBlock as! HeadBlock
            tailBlock.position = headBlock.position
            headBlock.position = newPosition
            if snakeBlockArr.count > 1 {
                let tailBodyBlock = tailBlock as! BodyBlock
                tailBodyBlock.direction = headBodyBlock.direction
                snakeBlockArr.removeAtIndex(0)
                snakeBlockArr.insert(tailBlock, atIndex: snakeBlockArr.count - 1)
            }
        }
    }
    
    // MARK: - 随机生成一个BodyBlock
    func addNewRandomBlock() {
        let totalNum = colNum * rowNum
        var newCol = 0
        var newRow = 0
        var newRan: Int
        var outFlag = true
        while outFlag {
            outFlag = false
            newRan = myRandom(totalNum - 1)
            newCol = newRan % colNum
            newRow = newRan / colNum
            for bodyBlock in snakeBlockArr {
                if bodyBlock.position.col == newCol && bodyBlock.position.row == newRow {
                    outFlag = true
                    break
                }
            }
        }
        let bonusPosition = PositionMake(newCol, newRow)
        bonusBlock = BonusBlock(position: bonusPosition, size: blockSize)
        bgView.addSubview(bonusBlock)
    }
    
    // MARK: - 判断是否撞墙
    func isReachWall(position: Position) -> Bool {
        return position.col < 0 || position.col >= colNum || position.row < 0 || position.row >= rowNum;
    }
    
    // MARK: - 判断是否撞自己
    func isReachSelf(position: Position) -> Bool {
        for snakeBlock in snakeBlockArr {
            if PositionEqualToPosition(snakeBlock.position, position) {
                return true
            }
        }
        return false
    }
    
    // MARK: - 结束
    func gameOver() {
        gameStop()
        failQuestionCount = failQuestionCount + 1
        residualQuestionCount = residualQuestionCount - 1
        if residualQuestionCount == 0 {
            gameWin()
        } else {
            isGameStar = false
             let alertView = SnakeAlertView(contentText: NSLocalizedString("gamesFail", comment: ""))
            alertView.frame = view.bounds
            view.addSubview(alertView)
            alertView.delegate = self
         }
    }
    
    func gameStop() {
        timer?.invalidate()
        bgView.userInteractionEnabled = false
     }
    
    // MARK: - 继续
    func gameContinue() {
         // 加入计时器
        timer = NSTimer(timeInterval: timeInterval, target: self, selector: #selector(SnakeViewController.everyFrameAction), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        
        bgView.userInteractionEnabled = true
    }
    
    // MARK: - 胜利
    func gameWin() {
        let gameOverStr = NSLocalizedString("gameOverStr", comment: "")
        let allStr = NSLocalizedString("allStr", comment: "")
        let acountStr = NSLocalizedString("acountStr", comment: "")
        let wrongStr = NSLocalizedString("wrongStr", comment: "")
        let correctStr = NSLocalizedString("correctStr", comment: "")
        let failStr = NSLocalizedString("failStr", comment: "")
         let alertView = SnakeAlertView(contentText: "\(gameOverStr)\(allStr)\(allQuestionCount)\(acountStr)，\(correctStr)\(rightQuestionCount)\(acountStr)，\(wrongStr)\(wrongQuestionCount)\(acountStr)，\(failStr)\(failQuestionCount)\(acountStr)")
        alertView.frame = view.bounds
        alertView.isGameWin = true
        view.addSubview(alertView)
        alertView.delegate = self
    }
    
    // MARK: - 返回
    func back() {
        print("返回")
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - UIGestureRecognizer的代理方法
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        let touchPoint = touch.locationInView(gestureRecognizer.view)
        let headBlock = snakeBlockArr.last
        if direction == Direction.Up || direction == Direction.Down {
            if touchPoint.x < headBlock?.x {
                direction = Direction.Left
            } else if touchPoint.x > headBlock?.maxX {
                direction = Direction.Right
            }
        } else {
            if touchPoint.y < headBlock?.y {
                direction = Direction.Up
            } else if touchPoint.y > headBlock?.maxY {
                direction = Direction.Down
            }
        }
        bgView.userInteractionEnabled = false
        return true
    }
    
    // MARK: - MyPopView的代理方法
    func myPopView(popview: MyPopView, contentText: String, resultNum: Int) {
        gameStart()
 
        questionString = "\(contentText)"
        self.resultNum = resultNum
    }
    
    // MARK: - SnakeAlertView的代理方法
    func snakeAlertView(alertView: SnakeAlertView, didClickOkButton button: UIButton) {
        getQuestionButotnClick()
        
    }
    
    func snakeAlertView(alertView: SnakeAlertView, didClickRestartButton button: UIButton) {
        residualQuestionCount = allQuestionCount
        rightQuestionCount = 0
        wrongQuestionCount = 0
        failQuestionCount = 0
        
        getQuestionButton.enabled = true
        answerButton.hidden = true
        self.isGameStar = false
    
        // 添加动画
        let animation = CABasicAnimation(keyPath: "transform.scale")
        getQuestionButton.layer.anchorPoint = CGPointMake(0.5, 0.5)
        animation.autoreverses = true
        animation.fromValue = 1.0
        animation.repeatCount = 10000000
        animation.toValue = 1.1
        animation.duration = 1.0
        getQuestionButton.layer.addAnimation(animation, forKey: "scale")
        
    }
    
    func snakeAlertView(alertView: SnakeAlertView, didClickBackButton button: UIButton) {
        back()
    }
    
    //    MARK:- 序列动画
    func imageAnimation(imageName:String, imageNumber: Int, RepeatCount: Int, imageViews:UIImageView, duration: CGFloat){
        
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
