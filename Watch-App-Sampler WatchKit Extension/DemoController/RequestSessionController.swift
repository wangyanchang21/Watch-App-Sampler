//
//  RequestSessionController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/27.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class RequestSessionController: WKInterfaceController {

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
        if let task = task {
            task.cancel()
        }
    }
    
    @IBAction func requestAction() {
        changeToLoaingState()
        
        let index = Int(arc4random() % 10)
        let url = urlArrary[index]
        
//        let session = URLSession(configuration: URLSessionConfiguration.default)
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        task = session.dataTask(with: url as URL) { (data, res, error) -> Void in
            if let newData = data {
                self.updateImage(data: newData)
            } else if error != nil {
                self.image.setImageNamed("error")
                print(error!.localizedDescription)
            }
        }
        task!.resume()
    }
    
    func changeToLoaingState() {
        image.setImageNamed("loading_")
        image.startAnimating()
    }
    
    func updateImage(data: Data) {
        DispatchQueue.main.async {
            self.image.setImage(UIImage(data: data))
        }
    }
}


extension RequestSessionController: URLSessionTaskDelegate, URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void){
        print("didReceive challenge")
        completionHandler(.performDefaultHandling, nil)
    }
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print("urlSessionDidFinishEvents")
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        print("didComplete")
    }

}
