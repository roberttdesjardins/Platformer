//
//  PhysicsCategory.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-07.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation

struct PhysicsCategory {
    static let None: UInt32 = 0
    static let Player: UInt32 = 0x1 << 1
    static let Enemy: UInt32 = 0x1 << 2
    
    static let Edge: UInt32 = 0x1 << 25
    static let All: UInt32 = UInt32.max
}
