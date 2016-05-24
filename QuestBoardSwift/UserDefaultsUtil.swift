//
//  UserDefaultsUtil.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/18/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit

class UserDefaultsUtil: NSObject {
    class func saveEmail(email: String) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setValue(email, forKey: "USER_EMAIL")
        userDefaults.synchronize()
    }
    
    class func getEmail() -> String {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        return userDefaults.valueForKey("USER_EMAIL") as! String
    }
}
