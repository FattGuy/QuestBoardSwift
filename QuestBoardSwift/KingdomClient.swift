//
//  KingdomClient.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/19/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import Gloss

class KingdomClient: NSObject {

    typealias Success = (success: AnyObject?) -> Void
    
    class func getEmailList(success: Success){
        let Url: NSString = APIInterface.HOST.stringByAppendingString(APIInterface.KINGDOMS_API)
        
        let params: NSMutableDictionary = [:]
        
        BaseHttpRequest.shareInstance.myGET(Url, parameters: params) { (response) in
            
            var mutArray = Array<Kingdom>()
            
            if response is Array <JSON> {
                
                
                for jsonObj in response as! Array<JSON> {
                    
                    if let kingdomList = Kingdom(json: jsonObj) {
                        mutArray.append(kingdomList)
                    }
                }
            }
            success(success: mutArray)
        }
    }
}
