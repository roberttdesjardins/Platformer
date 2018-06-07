//
//  GameScene.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-06.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        self.lastUpdateTime = 0
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        
        
        
        self.lastUpdateTime = currentTime
    }
}

protocol Entity {
    var name: String {get set}
    static func uid() -> String
    
    var size: CGSize {get set}
    var texture: String {get set}
}

extension Entity {
    static func uid() -> String {
        return UUID().uuidString
    }
}

protocol ObjectThatMoves {
    func move()
}

protocol ObjectThatAttacks {
    func attack()
}








