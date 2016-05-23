//
//  KingdomDetailClient.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/21/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import Gloss

class KingdomDetailClient: NSObject {

    typealias Success = (success: AnyObject?) -> Void
    
    class func getKingdomDetailList(kid: Int, success: Success){
        let Url: NSString = APIInterface.HOST.stringByAppendingString(APIInterface.KINGDOMS_API)
        
        let kidString = String(kid)
        let KINGDOMDETAIL_API = String.init(format: "/\(kidString)")
        
        let detailURL = Url.stringByAppendingString(KINGDOMDETAIL_API)
        
        BaseHttpRequest.shareInstance.myGET(detailURL, parameters: kid) { (response) in
            // parsing JSON
            var kingdomDetail: KingdomDetail
            kingdomDetail = KingdomDetail(json: response as! Dictionary)!
            
            success(success: kingdomDetail)
        }
    }
}
