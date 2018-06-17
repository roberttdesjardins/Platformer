//
//  CannonBall.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-17.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class CannonBall: SKSpriteNode, Entity, ObjectThatMoves {
    var isAlive: Bool = true
    var moveSpeed: Int = GameData.shared.cannonBallMoveSpeed
    
    func initCannonBall() {
        self.texture = SKTexture(imageNamed: "ball")
        self.size = GameData.shared.cannonBallSize
        self.zPosition = 1
        self.name = GameData.shared.cannonBallName
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = PhysicsCategory.Projectile
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        self.physicsBody?.collisionBitMask = PhysicsCategory.None
    }
    
    func move() {
        self.run(SKAction.moveTo(x: -self.size.width, duration: 2.0), completion: {self.removeFromParent()})
    }
    
    
}
