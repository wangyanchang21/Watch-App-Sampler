//
//  MediaPlayerController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/15.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class MediaPlayerController: WKInterfaceController {
    
    
    @IBAction func mp3PlayAction() {
        playMedia(name: "music", ex: ".mp3")
    }
    
    @IBAction func mp4PlayAction() {
        playMedia(name: "music", ex: ".mp4")
    }
    
    func playMedia(name: String, ex: String) {
        // MediaPlayer
        let URL = Bundle.main.url(forResource: name, withExtension: ex)
        let option = [WKMediaPlayerControllerOptionsAutoplayKey: true]

        presentMediaPlayerController(with: URL!, options: option) { (isEnd, endTime, error) in
            if error == nil {
                print("endTime=\(endTime)");
            } else {
                print("error=\(error!)")
            }
        }
    }

}
