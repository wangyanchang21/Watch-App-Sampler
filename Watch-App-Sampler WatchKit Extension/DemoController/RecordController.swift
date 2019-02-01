//
//  RecordController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/15.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class RecordController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.textVoiceInput()
        }
    }
    
    func textVoiceInput() {
        let option2: [String: Any] = [WKAudioRecorderControllerOptionsActionTitleKey: "发送",
                                       WKAudioRecorderControllerOptionsAutorecordKey: true,
                                       WKAudioRecorderControllerOptionsMaximumDurationKey: 30]
        
        /* Error: Error Domain=com.apple.watchkit.errors Code=3 "(null)"
        let string = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let url = NSURL.fileURL(withPath: string!.appending("myRecord.caf"))
        */
        
        // Use App Group URL
        let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.huaxia.record")
        let newUrl = url!.appendingPathComponent("record.wav")
        
        presentAudioRecorderController(withOutputURL:newUrl , preset: .narrowBandSpeech, options: option2) { (didSave, error) in
            if error == nil {
                print("didSave=\(didSave)");
            } else {
                print("error=\(error!)")
            }
        }
    }
    
}
