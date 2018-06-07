//
//  Player.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-07.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class Player : SKSpriteNode, Entity, ObjectThatMoves, ObjectThatAttacks {
    
    func initPlayer() {
        self.size = GameData.shared.playerSize
        self.zPosition = 6
        self.name = GameData.shared.playerName
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        self.physicsBody!.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = PhysicsCategory.Player
        self.physicsBody?.contactTestBitMask = PhysicsCategory.Edge
        self.physicsBody?.collisionBitMask = PhysicsCategory.Edge
    }
    
    func move() {
        // TODO
        // TODO: Call playerRunningAnim
    }
    
    func attack() {
        // TODO
    }
    
    func playerIdleAnim(player: Player) {
        player.size.width = 38
        var gifIdle: [SKTexture] = []
        for i in 0...3 {
            gifIdle.append(SKTexture(imageNamed: "player_idle_frame_\(i)_delay-0.13s"))
        }
        player.run(SKAction.repeatForever(SKAction.animate(with: gifIdle, timePerFrame: 0.13)))
    }
    
    func playerRunningAnim(player: Player) {
        player.size.width = 66
        var gifRunning: [SKTexture] = []
        for i in 0...11 {
            gifRunning.append(SKTexture(imageNamed: "player_running_frame_\(i)_delay-0.07s"))
        }
        player.run(SKAction.repeatForever(SKAction.animate(with: gifRunning, timePerFrame: 0.07)))
    }
    
}
