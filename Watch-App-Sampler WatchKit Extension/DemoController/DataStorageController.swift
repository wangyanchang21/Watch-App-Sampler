//
//  New.swift
//  Watch-App-Sampler WatchKit Extension
//
//  Created by DCSnail on 2018/7/4.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126

import WatchKit
import UIKit

class DataStorageController: WKInterfaceController {
    
    let kGroupKey_1 = "group.com.dcsnail.temp"
    let kGroupKey_2 = "group.huaxia.record"

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Keychain Storage
        let saveKey = "Watch-App-Sampler"
        let saveString = "DCSnail: https://github.com/wangyanchang21"
        saveToKeychain(key: saveKey, text: saveString)
        
        // Keychain Reading
        let text = readFromKeychain(key: saveKey)
        print(text ?? "Keychain: Found Nothing by \(saveKey)")
        
        
        // Accessing Settings at Runtime
        if let defaults = UserDefaults(suiteName: kGroupKey_1) {
            let numberString = defaults.object(forKey: "number")
            print(numberString ?? "UserDefaults: 'number' is Null")
        }
        
        // Use App Group URL
        let groupContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: kGroupKey_2)
        let textURL = groupContainer!.appendingPathComponent("record.text")
        print(textURL)
        
        do {
            let text = try String(contentsOf: textURL, encoding: String.Encoding.utf8)
            print(text)
        } catch {
            print("error")
        }
        
        
        // WatchKit Extension SandBox Path
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let cachePath = paths[0]
        print(cachePath)
                
    }
    
    func saveToKeychain(key: String, text: String) {
        let data = text.data(using: String.Encoding.unicode) as AnyObject
        KeychainHelper.saveKeychain(service: key, data: data)
    }
    
    func readFromKeychain(key: String) -> String? {
        var text: String?
        if let data = KeychainHelper.readKeychain(service: key) as? Data {
            text = String(data: data, encoding: String.Encoding.unicode)
        }
        return text
    }
    
}




