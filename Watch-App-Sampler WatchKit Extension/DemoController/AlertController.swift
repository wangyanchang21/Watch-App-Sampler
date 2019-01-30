//
//  AlertStyleController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/28.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class AlertController: WKInterfaceController {
    
    
    @IBAction func presentAlertStyleAction() {
        
        let confirmAction = WKAlertAction(title: "Ok", style: .default) {
            print("Ok")
        }
        let denyAction = WKAlertAction(title: "Deny", style: .destructive) {
            print("Deny")
        }
        let cancelAction = WKAlertAction(title: "Cancel", style: .cancel) {
            print("Cancel")
        }
        presentAlert(withTitle: "Tip", message: "Do you want to see it.", preferredStyle: .alert, actions: [confirmAction, denyAction, cancelAction])
    }
    
    
    @IBAction func presentSideBySideStyleAction() {
        
        let confirmAction = WKAlertAction(title: "Ok", style: .default) {
            print("Ok")
        }
        let denyAction = WKAlertAction(title: "Deny", style: .destructive) {
            print("Deny")
        }
        presentAlert(withTitle: "Tip", message: "Do you want to see it.", preferredStyle: .sideBySideButtonsAlert, actions: [confirmAction, denyAction])
    }
    
    
    @IBAction func presentSheetStyleAction() {
        
        let confirmAction = WKAlertAction(title: "Ok", style: .default) {
            print("Ok")
        }
        let denyAction = WKAlertAction(title: "Deny", style: .destructive) {
            print("Deny")
        }
        let cancelAction = WKAlertAction(title: "Custom Cancel", style: .cancel) {
            print("Cancel")
        }
        presentAlert(withTitle: "Tip", message: "Do you want to see it.", preferredStyle: .actionSheet, actions: [confirmAction, denyAction, cancelAction])
    }
}
