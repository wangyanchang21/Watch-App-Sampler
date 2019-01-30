//
//  InterfaceController.swift
//  WatchApp WatchKit Extension
//
//  Created by DCSnail on 2018/6/6.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import WatchKit
import Foundation
import PassKit

class MenusController: WKInterfaceController {

    override init() {
        print(#function)
    }
    
    deinit {
        print(#function)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        print(#function)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print(#function)
    }
    
    override func didAppear() {
        super.didAppear()
        // Called when watch interface is visible to user
        print(#function)
    }

    override func willDisappear() {
        super.willDisappear()
        // Called when watch interface is about to no longer be visible
        print(#function)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        print(#function)
    }
    
    @IBAction func menuActionInvest() {
        print(#function)
    }
    
    @IBAction func menuActionNotification() {
        print(#function)
    }
    
    @IBAction func menuActionQuestion() {
        print(#function)
        
        let string = "{\"formatVersion\":\"1\",\"passTypeIdentifier\":\"pass.captech\",\"serialNumber\":\"987645768\",\"teamIdentifier\":\"99999999999\"}"

        guard PKPassLibrary.isPassLibraryAvailable() else {
            print("不支持PKPass")
            return
        }
        guard let passData = string.data(using: .utf8) else {
            print("pass data 无效")
            return
        }
        
        do {
            let pass = try PKPass.init(data: passData)
            presentAddPassesController(withPasses: [pass]) {
                print("i am coming")
            }
        } catch let error{
            print(error)
        }
    }
    
    @IBAction func menuActionShare() {
        print(#function)

    }
    
}
