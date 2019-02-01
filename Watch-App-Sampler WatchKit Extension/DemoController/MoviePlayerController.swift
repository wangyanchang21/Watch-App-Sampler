//
//  MoviePlayerController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/7/4.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import WatchKit
import Foundation


class MoviePlayerController: WKInterfaceController {

    @IBOutlet var movie: WKInterfaceMovie!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        movie.setPosterImage(WKImage.init(imageName: "poster"))
    }

    @IBAction func mp3PrepareAction() {
        prepareMediaPlayer(name: "music", ex: ".mp3")
    }
    
    @IBAction func mp4PrepareAction() {
        prepareMediaPlayer(name: "music", ex: ".mp4")
    }

    func prepareMediaPlayer(name: String, ex: String) {
        // WKInterfaceMovie
        let URL = Bundle.main.url(forResource: name, withExtension: ex)
        movie.setMovieURL(URL!)
    }

}
