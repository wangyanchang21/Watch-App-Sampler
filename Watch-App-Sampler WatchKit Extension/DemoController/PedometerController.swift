//
//  PedometerController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/25.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit
import CoreMotion

class PedometerController: WKInterfaceController {
    
    @IBOutlet var stepLabel: WKInterfaceLabel!
    @IBOutlet var distanceLabel: WKInterfaceLabel!
    @IBOutlet var asendLabel: WKInterfaceLabel!
    @IBOutlet var paceLabel: WKInterfaceLabel!
    
    let pedometer = CMPedometer()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let state = CMPedometer.authorizationStatus()
        if state != .authorized {
            print("Please Authorize In Your iPhone App")
            return
        }
        
        if CMPedometer.isStepCountingAvailable() && CMPedometer.isDistanceAvailable() && CMPedometer.isFloorCountingAvailable() && CMPedometer.isPaceAvailable() {
            
            pedometer.startUpdates(from: Date()) { (data, error) in
                
                if let steps = data?.numberOfSteps {
                    self.stepLabel.setText(steps.stringValue)
                }
                if let distance = data?.distance {
                    self.distanceLabel.setText(String(format: "%.2f", distance.floatValue))
                }
                if let floorsAscended = data?.floorsAscended {
                    self.asendLabel.setText(floorsAscended.stringValue)
                }
                if let currentPace = data?.currentPace {
                    self.paceLabel.setText(currentPace.stringValue)
                }
            }
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        pedometer.stopUpdates()
    }
}
