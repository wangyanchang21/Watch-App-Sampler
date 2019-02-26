//
//  InterfaceController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/15.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import WatchKit
import Foundation


class ItemListController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    let dataArray = {
        return [
            
            ["image": "item_type_0", "title": "Menu Action And Controller Life Cycle" , "ID": "MenusController"],
            ["image": "item_type_1", "title": "Gesture Recongnizer" , "ID": "GestureRecongnizerController"],
            ["image": "item_type_2", "title": "Alert Style" , "ID": "AlertController"],
            // Picker
            ["image": "item_type_3", "title": "Picker Styles" , "ID": "PickerController"],
            ["image": "item_type_4", "title": "Picker With Animated Images" , "ID": "ProgressController"],
            // Animation/Gif
            ["image": "item_type_5", "title": "Animations And Gif Play" , "ID": "AnimationController"],
            // Media
            ["image": "item_type_6", "title": "Audio File Player" , "ID": "AudioFilePlayerController"],
            ["image": "item_type_6", "title": "Text And Voice Input" , "ID": "TextVoiceInputController"],
            ["image": "item_type_7", "title": "Media Player" , "ID": "MediaPlayerController"],
            ["image": "item_type_8", "title": "Record Audio" , "ID": "RecordController"],
            // Application Switch
            ["image": "item_type_9", "title": "Open URL" , "ID": "OpenURLController"],
            // connectivity between watch to iPhone
            ["image": "item_type_10", "title": "Interaction: iPhone & Watch" , "ID": "MessageController"],
            // Hardware measurement
            ["image": "item_type_11", "title": "Accelerometer Monitor" , "ID": "AccelerometerController"],
            ["image": "item_type_12", "title": "Gyroscope Monitor" , "ID": "GyroscopeController"],
            ["image": "item_type_13", "title": "Magnetometer Monitor" , "ID": "MagnetometerController"],
            ["image": "item_type_14", "title": "Device Motion" , "ID": "DeviceMotionController"],
            ["image": "item_type_15", "title": "Haptic Types" , "ID": "HapticTypeController"],
            // Location/Map
            ["image": "item_type_16", "title": "Location" , "ID": "LocationController"],
            ["image": "item_type_17", "title": "Map" , "ID": "MapController"],
            // Health/Activity
            ["image": "item_type_18", "title": "Motion Activity" , "ID": "MotionActivityController"],
            ["image": "item_type_19", "title": "Pedometer" , "ID": "PedometerController"],
            ["image": "item_type_20", "title": "Health" , "ID": "HealthController"],
            // Graphic Image
            ["image": "item_type_21", "title": "Quatz2D" , "ID": "Quatz2DController"],
            ["image": "item_type_22", "title": "Gradation" , "ID": "GradationController"],
            // Request
            ["image": "item_type_23", "title": "Request Session" , "ID": "RequestSessionController"],
            ["image": "item_type_25", "title": "Background Task" , "ID": "BackgroundTaskController"],
            // Data Storage
            ["image": "item_type_24", "title": "Data Storage" , "ID": "DataStorageController"],

          ]
    }()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Set Row Number And Row Type
        table.setNumberOfRows(dataArray.count, withRowType: "ItemRowController")
        
        for (i, info) in dataArray.enumerated() {
            let cell = table.rowController(at: i) as! ItemRowController
            cell.titleLabel.setText(info["title"])
            cell.image.setImageNamed(info["image"])
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        pushController(withName: dataArray[rowIndex]["ID"]!, context: dataArray[rowIndex])
    }

}
