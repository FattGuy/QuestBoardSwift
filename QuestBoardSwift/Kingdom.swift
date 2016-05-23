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
    
    var kingdomId: Int?
    var kingdomName: String?
    var imageURL: NSURL?
    
    required init?(json: JSON) {
        self.kingdomId = "id" <~~ json
        self.kingdomName = "name" <~~ json
        self.imageURL = "image" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.kingdomId,
            "name" ~~> self.kingdomName,
            "image" ~~> self.imageURL
        ])
    }
}
