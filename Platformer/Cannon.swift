//
//  Cannon.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-16.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class Cannon : SKSpriteNode, Entity, ObjectThatAttacks, ObjectThatMoves{
    var health: Int = 1
    
    var isAlive: Bool = true
    
    var attackDamage: Int = 1
    
    func attack() {
        
    }
    
    var moveSpeed: Int = Int(GameData.shared.deviceWidth / 100)
    
    func move() {
        
    }
    
    
}
