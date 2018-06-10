//
//  GameData.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-07.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


class GameData {
    static let shared = GameData()
    
    let playerName = "player"
    let playerSize = CGSize(width: 40, height: 40)
    let playerTexture = SKTexture(imageNamed: "player_idle_frame_0_delay-0.13s")
    let playerHealth = 100
    let playerAttackDamage = 10
    let playerMoveSpeed = 10
    let playerJumpHeight = 28
    
    let platformName = "platform"
    
    let enemy1Name = "enemy1"
    let enemy1Size = CGSize(width: 40, height: 40)
    let enemy1Texture = "" // TODO
    let enemy1Health = 10
    let enemy1AttackDamage = 2
    let enemy1MoveSpeed = 10
    let enemy1JumpHeight = 10
    
    private init() { }
}
