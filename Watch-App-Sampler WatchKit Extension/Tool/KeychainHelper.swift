//
//  KeychainHelper.swift
//  Watch-App-Sampler
//
//  Created by DCSnail on 2018/9/4.
//  Copyright © 2018年 DCSnail. All rights reserved.
//  DCSnail: https://github.com/wangyanchang21WatchOS
//  watchOS开发教程: https://blog.csdn.net/wangyanchang21/article/details/80928126
//

import Foundation

// Storing Data Securely in the Keychai
struct KeychainHelper {
    
    static func getKeychainQuery(service: String) -> NSMutableDictionary {
        return NSMutableDictionary(dictionary:
            [kSecClass: kSecClassGenericPassword,
             kSecAttrService: service,
             kSecAttrAccount: service,
             kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock])
    }
    
    static func saveKeychain(service: String, data: AnyObject) {
        let keychainQuery = self.getKeychainQuery(service: service)
        SecItemDelete(keychainQuery)
        keychainQuery.addEntries(from: [kSecValueData: NSKeyedArchiver.archivedData(withRootObject: data)])
        SecItemAdd(keychainQuery, nil)
    }
    
    static func readKeychain(service: String) -> AnyObject! {
        let keychainQuery = self.getKeychainQuery(service: service)
        keychainQuery.addEntries(from: [kSecReturnData: kCFBooleanTrue])
        keychainQuery.addEntries(from: [kSecMatchLimit: kSecMatchLimitOne])
        var keyData : AnyObject? = nil
        if SecItemCopyMatching(keychainQuery, &keyData) == noErr {
            let ret = NSKeyedUnarchiver.unarchiveObject(with: keyData as! Data)
            return ret as AnyObject
        } else {
            return nil
        }
    }
    
    static func deleteKeychain(service: String) {
        let keychainQuery = self.getKeychainQuery(service: service)
        SecItemDelete(keychainQuery)
    }
}
