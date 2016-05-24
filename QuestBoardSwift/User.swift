//
//  User.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var email: String?
    
    init(name: String, email: String) {
        
        super.init()
        
        self.name = name
        self.email = email
    }
}
