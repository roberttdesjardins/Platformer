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
        let moveFoward = SKAction.move(by: CGVector(dx: -GameData.shared.deviceWidth/10, dy: 0), duration: 2.0)
        let attack = SKAction.run {
            self.attack()
        }
        let moveBackwards = SKAction.move(by: CGVector(dx: GameData.shared.deviceWidth/10, dy: 0), duration: 2.0)
        let moveAttackMoveDelete = SKAction.sequence([moveFoward, attack, moveBackwards])
        self.run(moveAttackMoveDelete, completion: {
            self.removeFromParent()
        })
    }
    
    
}
