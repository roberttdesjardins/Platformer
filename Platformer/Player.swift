//
//  Player.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-07.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class Player : SKSpriteNode, Entity, ObjectThatAttacks, ObjectThatJumps, ObjectWithHealth {
    var isAlive = true
    var jumpHeight: Int = GameData.shared.playerJumpHeight
    var health: Int = GameData.shared.playerHealth
    var attackDamage: Int = GameData.shared.playerAttackDamage
    
    
    let uid: String = Player.uid()
    func initPlayer() {
        self.texture = GameData.shared.playerTexture
        self.size = GameData.shared.playerSize
        self.zPosition = 6
        self.name = GameData.shared.playerName
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        self.physicsBody!.isDynamic = true
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.restitution = 0.0
        self.physicsBody?.friction = 0.0
        self.physicsBody?.categoryBitMask = PhysicsCategory.Player
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Edge | PhysicsCategory.Platform | PhysicsCategory.Enemy | PhysicsCategory.Projectile
        self.physicsBody?.collisionBitMask = PhysicsCategory.Edge | PhysicsCategory.Platform
    }
    
    func attack() {
        // TODO
    }
    
    func jump() {
        self.physicsBody?.velocity.dy = 0
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: jumpHeight))
        playerJumpAnim(player: self)
    }
    
    
    func playerIdleAnim(player: Player) {
        player.size.width = 38
        var gifIdle: [SKTexture] = []
        for i in 0...3 {
            gifIdle.append(SKTexture(imageNamed: "player_idle_frame_\(i)_delay-0.13s"))
        }
        player.run(SKAction.repeatForever(SKAction.animate(with: gifIdle, timePerFrame: 0.13)), withKey: "playerIdle")
    }
    
    func playerRunningAnim(player: Player) {
        player.size.width = 66
        player.size.height = 48
        var gifRunning: [SKTexture] = []
        for i in 0...11 {
            gifRunning.append(SKTexture(imageNamed: "player_running_frame_\(i)_delay-0.07s"))
        }
        player.run(SKAction.repeatForever(SKAction.animate(with: gifRunning, timePerFrame: 0.07)), withKey: "playerRunning")
    }
    
    func playerJumpAnim(player: Player) {
        player.removeAction(forKey: "playerRunning")
        player.removeAction(forKey: "playerIdle")
        player.size.width = 61
        player.size.height = 77
        var gifJumping: [SKTexture] = []
        for i in 0...4 {
            gifJumping.append(SKTexture(imageNamed: "player_jumping_frame_\(i)_delay-0.1s"))
        }
        player.run(SKAction.animate(with: gifJumping, timePerFrame: 0.1), withKey: "playerJumping")
    }
    
}
