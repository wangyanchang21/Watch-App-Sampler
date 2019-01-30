//
//  BackgroundTaskController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/9/6.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import Foundation
import WatchKit

class BackgroundTaskController: WKInterfaceController {
    
    @IBOutlet var image: WKInterfaceImage!
    var task: URLSessionDataTask?
    
    let urlArrary = [
        URL(string:"https://cdn.pixabay.com/photo/2018/06/10/17/40/olives-3466908__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/24/03/06/ship-3493887__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/21/20/23/lamp-3489395__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/17/19/12/church-3481187__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/24/23/21/lily-3495722__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2016/01/29/20/54/dog-1168663__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/10/21/29/white-currant-3467373__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/01/01/23/38/ballerina-3055155__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/14/11/50/buttons-3474715__480.jpg")!,
        URL(string:"https://cdn.pixabay.com/photo/2018/06/12/01/04/road-3469810__480.jpg")!,]
    
    
    override func didDeactivate() {
        super.didDeactivate()

        print("didDeactivate")
        let semaphore = DispatchSemaphore(value: 0)
        ProcessInfo.processInfo.performExpiringActivity(withReason: "Image Downloading") { expiring in

            if expiring {
                print("ProcessInfo Complete")
                semaphore.signal()
            } else {
                print("ProcessInfo Not Complete")
                semaphore.wait(timeout: .now() + .seconds(60))
            }
        }
    }
    
    @IBAction func requestAction() {
        print("Start Download")
        
        let index = Int(arc4random() % 10)
        let url = urlArrary[index]
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        task = session.dataTask(with: url as URL) { (data, res, error) -> Void in
            print("End Download")
            if let newData = data {
                DispatchQueue.main.async {
                    self.image.setImage(UIImage(data: newData))
                    print("Update Completed")
                }
            }
        }
        task!.resume()
    }
}
