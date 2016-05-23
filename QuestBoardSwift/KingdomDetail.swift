//
//  KingdomDetail.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import Gloss

class KingdomDetail: Decodable {
    
    var kingdomId: Int?
    var kingdomName: String?
    var imageURL: NSURL?
    var climate: String?
    var population = Int?()
    var quests: Array<Quest>?
    
    init() {
        
    }
    
    required init?(json: JSON) {
        self.kingdomId = "id" <~~ json
        self.kingdomName = "name" <~~ json
        self.imageURL = "image" <~~ json
        self.climate = "climate" <~~ json
        self.population = ("population" <~~ json)!
        self.quests = "quests" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.kingdomId,
            "name" ~~> self.kingdomName,
            "image" ~~> self.imageURL,
            "climate" ~~> self.climate,
            "population" ~~> self.population,
            "quests" ~~> self.quests
            ])
    }
}
