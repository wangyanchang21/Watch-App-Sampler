//
//  AnimationController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/22.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import ImageIO

let kAnimationInterval = 1.5


class AnimationController: WKInterfaceController {
    
    @IBOutlet var ghostImage: WKInterfaceImage!
    var flag = 0
    var isAnimating = false
    
    @IBAction func playAnimation() {
        if isAnimating == true {
            return
        }
        isAnimating = true
        
        switch flag % 4 {
        case 0:
            panningAnimation()
        case 1:
            zoomingAnimation()
        case 2:
            fadingAnimation()
        default:
            playGifImage()
        }
        flag = flag + 1
    }
    
    func fadingAnimation() {
        animate(withDuration: kAnimationInterval) {
            self.ghostImage.setAlpha(0.0)
        }
        returnToOriginalState()
    }
    
    func zoomingAnimation() {
        animate(withDuration: kAnimationInterval) {
            self.ghostImage.setWidth(120.0)
            self.ghostImage.setHeight(120.0)
        }
        returnToOriginalState()
    }
    
    func panningAnimation() {
        animate(withDuration: kAnimationInterval) {
            self.ghostImage.setHorizontalAlignment(.right)
        }
        returnToOriginalState()
    }
    
    func returnToOriginalState() {
        DispatchQueue.main.asyncAfter(deadline: .now() + kAnimationInterval) {
            self.animate(withDuration: kAnimationInterval) {
                self.ghostImage.setHorizontalAlignment(.center)
                self.ghostImage.setWidth(60.0)
                self.ghostImage.setHeight(60.0)
                self.ghostImage.setAlpha(1.0)
                self.isAnimating = false
            }
        }
    }
    
    func playGifImage() {
        ghostImage.setImageNamed("Loading_")
        ghostImage.startAnimatingWithImages(in: NSRange(location: 1, length: 28), duration: kAnimationInterval, repeatCount: 1)
//        ghostImage.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + kAnimationInterval) {
            self.ghostImage.setImageNamed("ghost")
            self.isAnimating = false
        }
    }
    
}
