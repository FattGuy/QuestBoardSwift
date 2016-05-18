//
//  BaseHttpRequest.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit
import AFNetworking
import SVProgressHUD

class BaseHttpRequest: NSObject {
    
    static let shareInstance = BaseHttpRequest()
    static let requestManager = AFHTTPSessionManager()
    
    typealias Response = (response: AnyObject?) -> Void
    
    func myGET(url: NSString!, parameters: AnyObject?, response: Response) {
        BaseHttpRequest.requestManager.GET(url as String, parameters: parameters, progress: nil, success: { (task: NSURLSessionDataTask, responseObject) in
            response(response: responseObject)
        }) { (task: NSURLSessionTask?, error) in
            self.failureOperation()
        }
    }
    
    func myPOST(url: NSString?, parameters: AnyObject?, response: Response) {
        BaseHttpRequest.requestManager.POST(url as! String, parameters: parameters, progress: nil, success: { (task: NSURLSessionDataTask, responseObject) in
            response(response: responseObject)
        }) { (task: NSURLSessionTask?, error) in
            self.failureOperation()
        }
    }
    
    func failureOperation() {
        SVProgressHUD.showInfoWithStatus("Request Error")
    }
}

