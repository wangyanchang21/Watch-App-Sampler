//
//  TextVoiceInputController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/15.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class TextVoiceInputController: WKInterfaceController {
    
    @IBOutlet var contentLabel: WKInterfaceLabel!
    

    @IBAction func textVoiceInputAction() {
        presentTextInputController(withSuggestions: ["Hello!", "When are you free?", "Yes."], allowedInputMode: .plain) { (inputText) in
            if let stringArr = inputText {
                self.contentLabel.setText(stringArr[0] as? String)
            }
        }
    }
    
}
