//
//  AccelerometerController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/22.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import CoreMotion

class GyroscopeController: WKInterfaceController {
    
    @IBOutlet var XLabel: WKInterfaceLabel!
    @IBOutlet var YLabel: WKInterfaceLabel!
    @IBOutlet var ZLabel: WKInterfaceLabel!
    
    lazy var motionManager: CMMotionManager = {
        let manager = CMMotionManager()
        manager.gyroUpdateInterval = 0.1
        return manager
    }()
    
    
    override func willActivate() {
        super.willActivate()
        
        if motionManager.isGyroAvailable {
            
            motionManager.startGyroUpdates(to: OperationQueue.main) { (data, error) in
                if let rotationRate = data?.rotationRate {
                    self.XLabel.setText(String(format: "%.2f", rotationRate.x))
                    self.YLabel.setText(String(format: "%.2f", rotationRate.y))
                    self.ZLabel.setText(String(format: "%.2f", rotationRate.z))
                }
            }
        } else {
            XLabel.setText("Not Available")
            YLabel.setText("Not Available")
            ZLabel.setText("Not Available")
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        motionManager.stopGyroUpdates()
    }
}
