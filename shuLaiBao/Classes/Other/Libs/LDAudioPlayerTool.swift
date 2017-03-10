//
//  LDAudioPlayerTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/3/14.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import AVFoundation

class LDAudioPlayerTool: NSObject {

    enum Exc: ErrorType {
        case Oops
    }

    var thePlayers:AVAudioPlayer!
    internal static let shareAudioPlayer = LDAudioPlayerTool()
    
    override init()  {
         super.init()
          let musicURL  = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("backGround_sound", ofType: "mp3")!)
         do{
            thePlayers  = try AVAudioPlayer(contentsOfURL: musicURL)
            thePlayers.prepareToPlay()
            thePlayers.numberOfLoops = -1
            thePlayers.volume = 0.5
       
        } catch let error as NSError{
            print("不能创建背景音乐\(error)")
        }
 
     }
    

}
