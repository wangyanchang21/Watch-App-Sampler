//
//  MessageController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/19.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  Watch与 iPhone的通信: https://blog.csdn.net/wangyanchang21/article/details/81017017
//

import UIKit
import WatchKit
import WatchConnectivity

class MessageController: WKInterfaceController {

    @IBOutlet var contentLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        do {
            try WCSession.default.updateApplicationContext(["a":"b"])
        } catch {
            
        }
        
        configureWCSession()
    }
    
    func configureWCSession() {
        // Don't need to check isSupport state, because session is always available on WatchOS
        // if WCSession.isSupported() {}
        let session = WCSession.default
        session.delegate = self
        session.activate()
    }
    
    @IBAction func sendMessageToiPhoneAction() {
        
        if !WCSession.default.isReachable {
            let action = WKAlertAction(title: "OK", style: .default) {
                print("OK")
            }
            presentAlert(withTitle: "Failed", message: "Apple Watch is not reachable.", preferredStyle: .alert, actions: [action])
            return
        } else {
            // The counterpart is not available for living messageing
        }
        
        let date = Date(timeIntervalSinceNow: 0.0)
        let message = ["title": "Apple Watch send a messge to iPhone", "watchMessage": "The Date is \(date.description)"]
        WCSession.default.sendMessage(message, replyHandler: { (replyMessage) in
            print(replyMessage)
            DispatchQueue.main.sync {
                self.contentLabel.setText(replyMessage["replyContent"] as? String)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}

extension MessageController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if error == nil {
            print(activationState)
        } else {
            print(error!.localizedDescription)
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        print(session)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print(message)
        replyHandler(["title": "received successfully", "replyContent": "This is a reply from watch"])
        DispatchQueue.main.sync {
            contentLabel.setText(message["iPhoneMessage"] as? String)
        }
    }
}
