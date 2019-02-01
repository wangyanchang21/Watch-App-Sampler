//
//  typeController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/22.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class HapticTypeController: WKInterfaceController {
    
    @IBOutlet var typeLabel: WKInterfaceLabel!
    
    let typeNameArray = ["Notification", "DirectionUp", "DirectionDown", "Success", "Failure", "Retry", "Start", "Stop", "Click"]
    let hapticTypeArray: [WKHapticType] = [.notification, .directionUp, .directionDown, .success, .failure, .retry, .start, .stop, .click]
    var flag = 0

    @IBAction func tapticEnginePlay() {
        let index = flag % 9
        typeLabel.setText("This is " + typeNameArray[index])
        WKInterfaceDevice.current().play(hapticTypeArray[index])
        flag = flag + 1
    }
}
