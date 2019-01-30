//
//  ItemProgressController.swift
//  WatchApp WatchKit Extension
//
//  Created by DCSnail on 2018/6/14.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class ProgressController: WKInterfaceController {

    @IBOutlet var progressGroup: WKInterfaceGroup!
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        var images: [UIImage]! = []
        var pickerItems: [WKPickerItem]! = []
        for i in 0...100 {
            let name = "activity-\(i)"
            images.append(UIImage(named: name)!)
            
            let pickerItem = WKPickerItem()
            pickerItem.title = "No.\(i)"
            pickerItems.append(pickerItem)
        }
        
        let progressImages = UIImage.animatedImage(with: images, duration: 0.0)
        progressGroup.setBackgroundImage(progressImages)
        picker.setCoordinatedAnimations([progressGroup])
        picker.setItems(pickerItems)
    }
    
}
