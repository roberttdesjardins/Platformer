//
//  Enemy1.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-07.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy1 : SKSpriteNode, Entity, ObjectThatMoves, ObjectThatAttacks {
    var moveSpeed: Int = GameData.shared.enemy1MoveSpeed
    
    var health: Int = GameData.shared.enemy1Health
    
    
    func move() {
        // TODO
    }
    
    func attack() {
        // TODO
    }
}
