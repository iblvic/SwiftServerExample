//
//  NoteHelper.swift
//  NoteDemo
//
//  Created by Hao's iMac on 2019/6/14.
//  Copyright © 2019 Hao's iMac. All rights reserved.
//

import Foundation

let kUserName = "userName"
let kTokenKey = "token"
let kExpirationTime = "expirationTime"



class NoteHelper {
    
    public static func saveUser(_ userName: String, _ token: String, _ expirationTime: TimeInterval) {
        
        guard userName.lengthOfBytes(using: .utf8) > 0 else {
            return
        }
        let dict: [String: Any] = [kTokenKey: token, kExpirationTime: expirationTime]
        UserDefaults.standard.setValue(dict, forKey: userName)
        UserDefaults.standard.setValue(userName, forKey: kUserName)
        UserDefaults.standard.synchronize()
    }
    
    public static func tokenForUserName(_ userName: String) -> String? {
        guard userName.lengthOfBytes(using: .utf8) > 0 else {
            return ""
        }
        let dict: [String: Any] = UserDefaults.standard.object(forKey: userName) as! [String: Any]
        return dict[kTokenKey] as? String
    }
    
    public static func expirationTimeForUserName(_ userName: String) -> TimeInterval {
        guard userName.lengthOfBytes(using: .utf8) > 0 else {
            return 0.0
        }
        let dict: [String: Any] = UserDefaults.standard.object(forKey: userName) as! [String: Any]
        return dict[kExpirationTime] as! TimeInterval
    }
    
    public static func loginedUser() -> String? {
        
        let userName = UserDefaults.standard.object(forKey: kUserName)
        return userName as? String
    }
}
