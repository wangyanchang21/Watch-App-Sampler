//
//  DeviceMotionController.swift
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

class DeviceMotionController: WKInterfaceController {
    
    @IBOutlet var RollLabel: WKInterfaceLabel!
    @IBOutlet var PitchLabel: WKInterfaceLabel!
    @IBOutlet var YawLabel: WKInterfaceLabel!
    
    @IBOutlet var RotXLabel: WKInterfaceLabel!
    @IBOutlet var RotYLabel: WKInterfaceLabel!
    @IBOutlet var RotZLabel: WKInterfaceLabel!
    
    @IBOutlet var GraXLabel: WKInterfaceLabel!
    @IBOutlet var GraYLabel: WKInterfaceLabel!
    @IBOutlet var GraZLabel: WKInterfaceLabel!
    
    @IBOutlet var AccXLabel: WKInterfaceLabel!
    @IBOutlet var AccYLabel: WKInterfaceLabel!
    @IBOutlet var AccZLabel: WKInterfaceLabel!
    
    @IBOutlet var MagXLabel: WKInterfaceLabel!
    @IBOutlet var MagYLabel: WKInterfaceLabel!
    @IBOutlet var MagZLabel: WKInterfaceLabel!
    @IBOutlet var MagAccLabel: WKInterfaceLabel!
    
    @IBOutlet var headingLabel: WKInterfaceLabel!
    
    
    lazy var motionManager: CMMotionManager = {
        let manager = CMMotionManager()
        manager.deviceMotionUpdateInterval = 0.1
        return manager
    }()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if motionManager.isDeviceMotionAvailable {
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                if let attitude = data?.attitude {
                    self.RollLabel.setText(String(format: "%.2f", attitude.roll))
                    self.PitchLabel.setText(String(format: "%.2f", attitude.pitch))
                    self.YawLabel.setText(String(format: "%.2f", attitude.yaw))
                }
                if let rotationRate = data?.rotationRate {
                    self.RotXLabel.setText(String(format: "%.2f", rotationRate.x))
                    self.RotYLabel.setText(String(format: "%.2f", rotationRate.y))
                    self.RotZLabel.setText(String(format: "%.2f", rotationRate.z))
                }
                if let gravity = data?.gravity {
                    self.GraXLabel.setText(String(format: "%.2f", gravity.x))
                    self.GraYLabel.setText(String(format: "%.2f", gravity.y))
                    self.GraZLabel.setText(String(format: "%.2f", gravity.z))
                }
                if let userAcceleration = data?.userAcceleration {
                    self.AccXLabel.setText(String(format: "%.2f", userAcceleration.x))
                    self.AccYLabel.setText(String(format: "%.2f", userAcceleration.y))
                    self.AccZLabel.setText(String(format: "%.2f", userAcceleration.z))
                }
                if let magneticField = data?.magneticField.field {
                    self.MagXLabel.setText(String(format: "%.2f", magneticField.x))
                    self.MagYLabel.setText(String(format: "%.2f", magneticField.y))
                    self.MagZLabel.setText(String(format: "%.2f", magneticField.z))
                }
                if let accuracy = data?.magneticField.accuracy {
                    self.MagAccLabel.setText("\(accuracy)")
                }
                if let heading = data?.heading {
                    self.headingLabel.setText(String(format: "%.2f", heading))
                }
            }
        } else {
            print("Not Available")
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        motionManager.stopDeviceMotionUpdates()
    }
}
