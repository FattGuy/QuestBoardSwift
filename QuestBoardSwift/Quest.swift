//
//  Quest.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import Gloss

class Quest: Decodable {
    
    var questId: Int?
    var questName: String?
    var qImageURL: NSURL?
    var questDescription: String?
    var giver: QuestGiver?
    
    
    required init?(json: JSON) {
        self.questId = "id" <~~ json
        self.questName = "name" <~~ json
        self.qImageURL = "image" <~~ json
        self.questDescription = "description" <~~ json
        self.giver = "giver" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.questId,
            "name" ~~> self.questName,
            "image" ~~> self.qImageURL,
            "description" ~~> self.questDescription,
            "giver" ~~> self.giver
            ])
    }
}
