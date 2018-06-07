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
    let playerTexture = "" // TODO
    
    let enemy1Name = "enemy1"
    let enemy1Size = CGSize(width: 40, height: 40)
    let enemy1Texture = "" // TODO
    
    private init() { }
}
