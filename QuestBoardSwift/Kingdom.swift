//
//  Kingdom.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/18/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import Gloss

class Kingdom: Decodable {
    
    let kingdomId: Int?
    let kingdomName: String?
    let imageURL: NSURL?
    
    required init?(json: JSON) {
        self.kingdomId = "id" <~~ json
        self.kingdomName = "name" <~~ json
        self.imageURL = "image" <~~ json
    }
    
}
