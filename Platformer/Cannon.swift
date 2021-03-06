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
    
    var isAlive: Bool = true
    
    var attackDamage: Int = 1

    
    func attack(handleComplete:@escaping (()->())) {
        print("Cannon Attacking")
        let cannonBall = CannonBall()
        cannonBall.initCannonBall()
        cannonBall.position = self.position
        worldNode.addChild(cannonBall)
        let cannonBallWait = SKAction.wait(forDuration: 0.5)
        let cannonBallMove = SKAction.run {
            cannonBall.move()
        }
        cannonBall.run(SKAction.sequence([cannonBallWait, cannonBallMove]))
        
        var gifCannonAttack: [SKTexture] = []
        for i in 1...7 {
            gifCannonAttack.append(SKTexture(imageNamed: "black_cannon_frame_00\(i)"))
        }
        
        let attack = SKAction.animate(with: gifCannonAttack, timePerFrame: 0.1)
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
