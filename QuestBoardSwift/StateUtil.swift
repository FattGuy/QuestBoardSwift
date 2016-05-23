//
//  StateUtil.swift
//  QuestBoardSwift
//
//  Created by Feng Chang on 5/17/16.
//  Copyright © 2016 FattGuy. All rights reserved.
//

import Foundation

typealias newEnum = SignUpState

enum SignUpState: UInt{
    case EmptyEmail
    case WrongFormatEmail
    case Correct
}
