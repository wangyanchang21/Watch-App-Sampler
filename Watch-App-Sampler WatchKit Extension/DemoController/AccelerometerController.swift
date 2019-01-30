//
//  AccelerometerController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/22.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import CoreMotion

class AccelerometerController: WKInterfaceController {
    
    @IBOutlet var XLabel: WKInterfaceLabel!
    @IBOutlet var YLabel: WKInterfaceLabel!
    @IBOutlet var ZLabel: WKInterfaceLabel!
    
    lazy var motionManager: CMMotionManager = {
        let manager = CMMotionManager()
        manager.accelerometerUpdateInterval = 0.1
        return manager
    }()
    
    
    override func willActivate() {
        super.willActivate()
        
        if motionManager.isAccelerometerAvailable {
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                if let acceleration = data?.acceleration {
                    self.XLabel.setText(String(format: "%.2f", acceleration.x))
                    self.YLabel.setText(String(format: "%.2f", acceleration.y))
                    self.ZLabel.setText(String(format: "%.2f", acceleration.z))
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
        
        motionManager.stopAccelerometerUpdates()
    }
}
