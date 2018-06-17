//
//  Cannon.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-16.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class Cannon : SKSpriteNode, Entity{
    var health: Int = 1
    
    var isAlive: Bool = true
    
    var attackDamage: Int = 1

    
    func attack(handleComplete:@escaping (()->())) {
        //TODO: Attack
        print("Cannon Attacking")
        let attack = SKAction.move(by: CGVector(dx: 0, dy: 25), duration: 2)
        self.run(attack, completion: {handleComplete()})
    }
    
    func run(size: CGSize) {
        let moveFoward = SKAction.move(by: CGVector(dx: -size.width, dy: 0), duration: 3.0)
        let moveBackwards = SKAction.move(by: CGVector(dx: size.width, dy: 0), duration: 3.0)
        let attack = SKAction.run {
            self.attack { () -> () in
                self.run(moveBackwards, completion: { self.removeFromParent()})
            }
        }
        self.run(SKAction.sequence([moveFoward, attack]))
    }
    
    
}
