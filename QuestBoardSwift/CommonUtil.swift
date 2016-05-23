//
//  CommonUtil.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit

class CommonUtil: NSObject {
    class func isValidEmail(email: String) -> SignUpState {
        if email == "" {
            return SignUpState.EmptyEmail
        }
        
        let emailFormat: String = "^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        
        if emailTest.evaluateWithObject(email) {
            return SignUpState.Correct
        } else {
            return SignUpState.WrongFormatEmail
        }
    }
    
    class func imageWithColor(color: UIColor) -> UIImage {
        
        let rect: CGRect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
