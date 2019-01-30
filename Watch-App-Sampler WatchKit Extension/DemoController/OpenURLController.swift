
//
//  OpenURLController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/27.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class OpenURLController: WKInterfaceController {

    
    @IBAction func openTelAction() {
        let url = URL(string: "tel://10086")!
        WKExtension.shared().openSystemURL(url)
    }
    
    @IBAction func openMessageAction() {
        let url = URL(string: "sms://10010")!
        WKExtension.shared().openSystemURL(url)
    }
    
}
