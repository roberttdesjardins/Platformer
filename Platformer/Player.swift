//
//  Player.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-07.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class Player : Entity, ObjectThatMoves, ObjectThatAttacks {
    var name: String = ""
    
    var size: CGSize = GameData.shared.playerSize
    
    var texture: String = GameData.shared.playerTexture
    
    func move() {
        <#code#>
    }
    
    func attack() {
        <#code#>
    }
    
}
