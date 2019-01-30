//
//  InterfaceController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/15.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import WatchKit
import Foundation


class ItemListController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    let dataArray = {
        return [
            
            ["image": "item_type_0", "title": "Menu Action And Controller Life Cycle" , "ID": "MenusController"],
            ["image": "item_type_2", "title": "Alert Style" , "ID": "AlertController"],
            // Picker
            ["image": "item_type_3", "title": "Picker Styles" , "ID": "PickerController"],
            ["image": "item_type_4", "title": "Picker With Animated Images" , "ID": "ProgressController"],
            // 动画和Gif
            ["image": "item_type_5", "title": "Animations And Gif Play" , "ID": "AnimationController"],
            // 媒体
            ["image": "item_type_6", "title": "Text And Voice Input" , "ID": "TextVoiceInputController"],
            ["image": "item_type_7", "title": "Media Player" , "ID": "MediaPlayerController"],
            ["image": "item_type_8", "title": "Record Audio" , "ID": "RecordController"],
            // 应用跳转
            ["image": "item_type_9", "title": "Open URL" , "ID": "OpenURLController"],
            // 手表和手机间的通信
            ["image": "item_type_10", "title": "Interaction: iPhone & Watch" , "ID": "MessageController"],
            // 加速计/陀螺仪/磁力计等
            ["image": "item_type_11", "title": "Accelerometer Monitor" , "ID": "AccelerometerController"],
            ["image": "item_type_12", "title": "Gyroscope Monitor" , "ID": "GyroscopeController"],
            ["image": "item_type_13", "title": "Magnetometer Monitor" , "ID": "MagnetometerController"],
            ["image": "item_type_14", "title": "Device Motion" , "ID": "DeviceMotionController"],
            ["image": "item_type_15", "title": "Haptic Types" , "ID": "HapticTypeController"],
            // 地图和定位
            ["image": "item_type_16", "title": "Location" , "ID": "LocationController"],
            ["image": "item_type_17", "title": "Map" , "ID": "MapController"],
            // 运动和健康
            ["image": "item_type_18", "title": "Motion Activity" , "ID": "MotionActivityController"],
            ["image": "item_type_19", "title": "Pedometer" , "ID": "PedometerController"],
            ["image": "item_type_20", "title": "Health" , "ID": "HealthController"],
            // 图像绘制
            ["image": "item_type_21", "title": "Quatz2D" , "ID": "Quatz2DController"],
            ["image": "item_type_22", "title": "Gradation" , "ID": "GradationController"],
            // 数据请求
            ["image": "item_type_23", "title": "Request Session" , "ID": "RequestSessionController"],
            // 数据持有化
            ["image": "item_type_24", "title": "Data Storage" , "ID": "DataStorageController"],
            
            ["image": "item_type_25", "title": "Background Task" , "ID": "BackgroundTaskController"],

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




extension ItemListController {
    
    func backgroundMonitor() {
        WKExtension.shared().scheduleSnapshotRefresh(withPreferredDate: Date(), userInfo: nil) { (error) in
            print("监听截图")
        }
        
        WKExtension.shared().scheduleBackgroundRefresh(withPreferredDate: Date(), userInfo: nil) { (error) in
            print("监听后台刷新")
        }
    }
    
}

// 后台下载监听
extension ItemListController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willBeginDelayedRequest request: URLRequest, completionHandler: @escaping (URLSession.DelayedRequestDisposition, URLRequest?) -> Void) {
        print("继续下载")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        print("下载进度")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("下载完成")
    }
    
}
