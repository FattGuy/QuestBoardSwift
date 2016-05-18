//
//  SignUpClient.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import SVProgressHUD
import AFNetworking

class SignUpClient: BaseHttpRequest {
    typealias Success = (success: AnyObject?) -> Void
    
    class func signUp(user: User?, success: Success){
        let Url: NSString = APIInterface.HOST.stringByAppendingString(APIInterface.SIGN_UP_API)
        
        let params: NSMutableDictionary = [:]
        
        if (user != nil) {
            params.setObject((user?.email)!, forKey: "email")
            params.setObject((user?.name)!, forKey: "name")
        }
        
        BaseHttpRequest.shareInstance.myPOST(Url, parameters: params) { (response) in
            success(success: response)
        }
    }
    
}
