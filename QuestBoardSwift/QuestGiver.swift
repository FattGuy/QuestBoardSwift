//
//  QuestGiver.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import Gloss

class QuestGiver: Decodable {

    var giverId: Int?
    var giverName: String?
    var gImageURL: NSURL?
    
    required init?(json: JSON) {
        self.giverId = "id" <~~ json
        self.giverName = "name" <~~ json
        self.gImageURL = "image" <~~ json
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.giverId,
            "name" ~~> self.giverName,
            "image" ~~> self.gImageURL
            ])
    }
}
