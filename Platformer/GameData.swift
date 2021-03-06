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
    
    var deviceWidth = UIScreen.main.bounds.size.width
    var deviceHeight = UIScreen.main.bounds.size.height
    
    let playerName = "player"
    let playerSize = CGSize(width: 40, height: 40) // TODO: Change based on screen size
    let playerTexture = SKTexture(imageNamed: "player_idle_frame_0_delay-0.13s")
    let playerHealth = 100
    let playerAttackDamage = 10
    let playerMoveSpeed = 10
    //let playerJumpHeight = 28
    let playerJumpHeight = 17
    let playerJumpHolding: CGFloat = 2.4
    
    let platformName = "platform"
    
    let cannonName = "cannon"
    
    let cannonBallName = "cannonBall"
    let cannonBallSize = CGSize(width: 40, height: 40) // TODO: Change based on cannon size
    let cannonBallMoveSpeed = 40
    
    private init() { }
}
