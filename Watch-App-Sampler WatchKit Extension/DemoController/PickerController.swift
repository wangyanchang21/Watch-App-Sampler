//
//  PickerController.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/6/21.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import UIKit
import WatchKit

class PickerController: WKInterfaceController {
    
    @IBOutlet var listPicker: WKInterfacePicker!
    @IBOutlet var stackPicker: WKInterfacePicker!
    @IBOutlet var sequencePicker: WKInterfacePicker!
    
    lazy var itemArray: [WKPickerItem] = {
        var its = [WKPickerItem]()
        let titles = ["①", "②", "③", "④", "⑤"]
        let captions = ["① is one", "② is two", "③ is three", "④ is four", "⑤ is five"]
        
        for i in 0...4 {
            let item = WKPickerItem()
            item.title = titles[i]
            item.caption = captions[i]
            let string = "item_type_\(i + 1)"
            item.accessoryImage = WKImage(imageName: string)
            item.contentImage = WKImage(imageName: string)
            its.append(item)
        }
        return its
    }()
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        listPicker.setItems(itemArray)
        stackPicker.setItems(itemArray)
        sequencePicker.setItems(itemArray)
        
        listPicker.focus()
    }
    
    @IBAction func listPickerSelect(_ value: Int) {
        print(itemArray[value].title!)
    }

    @IBAction func stackPickerSelect(_ value: Int) {
        print(itemArray[value].title!)
    }
    
    @IBAction func sequencePickerSelect(_ value: Int) {
        print(itemArray[value].title!)
    }
    
    override func pickerDidFocus(_ picker: WKInterfacePicker) {
        if picker == listPicker {
            print("ListPicker Did Focus")
        } else if picker == stackPicker {
            print("StackPicker Did Focus")
        } else {
            print("SequencePicker Did Focus")
        }
    }

    override func pickerDidResignFocus(_ picker: WKInterfacePicker) {
        if picker == listPicker {
            print("ListPicker Did Resign Focus")
        } else if picker == stackPicker {
            print("StackPicker Did Resign Focus")
        } else {
            print("SequencePicker Did Resign Focus")
        }
    }
    
    override func pickerDidSettle(_ picker: WKInterfacePicker) {
        if picker == listPicker {
            print("ListPicker Did Settle")
        } else if picker == stackPicker {
            print("StackPicker Did Settle")
        } else {
            print("SequencePicker settle")
        }
    }

}
