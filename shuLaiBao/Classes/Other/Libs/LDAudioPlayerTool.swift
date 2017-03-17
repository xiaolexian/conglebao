//
//  LDAudioPlayerTool.swift
//  shuLaiBao
//
//  Created by liudeng on 16/3/14.
//  Copyright © 2016年 liudeng. All rights reserved.
//

import AVFoundation

class LDAudioPlayerTool: NSObject {

    enum Exc: Error {
        case oops
    }

    var thePlayers:AVAudioPlayer!
    internal static let shareAudioPlayer = LDAudioPlayerTool()
    
    override init()  {
         super.init()
          let musicURL  = URL(fileURLWithPath: Bundle.main.path(forResource: "backGround_sound", ofType: "mp3")!)
         do{
            thePlayers  = try AVAudioPlayer(contentsOf: musicURL)
            thePlayers.prepareToPlay()
            thePlayers.numberOfLoops = -1
            thePlayers.volume = 0.5
       
        } catch let error as NSError{
            print("不能创建背景音乐\(error)")
        }
 
     }
    

}
