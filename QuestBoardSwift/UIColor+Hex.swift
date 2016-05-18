//
//  UIColor+Hex.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hexString: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hexString & 0xff0000) >> 16) / divisor
        let green   = CGFloat((hexString & 0x00ff00) >>  8) / divisor
        let blue    = CGFloat((hexString & 0x0000ff)      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


