//
//  NotificationController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/15.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  WatchOS通知开发教程: https://blog.csdn.net/wangyanchang21/article/details/82149404
//

import WatchKit
import Foundation
import UserNotifications


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var contentLabel: WKInterfaceLabel!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        
        print("notification: \(notification)")
        titleLabel.setText(notification.request.content.title)
        contentLabel.setText(notification.request.content.body)
        
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.custom)
    }
    
    
    
}
