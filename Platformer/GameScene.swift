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
    let worldNode = SKNode()
    
    // Background
    let sky1 = SKSpriteNode(imageNamed: "sky")
    let sky2 = SKSpriteNode(imageNamed: "sky")
    let clouds1 = SKSpriteNode(imageNamed: "clouds")
    let clouds2 = SKSpriteNode(imageNamed: "clouds")
    let sea1 = SKSpriteNode(imageNamed: "sea")
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        addChild(worldNode)
        self.lastUpdateTime = 0
        setUpBackground()
        setUpPlayer()
        //setUpEnvironment()
    }
    
    func setUpBackground() {
        setUpSky()
        setUpClouds()
        
    }
    
    func setUpSky() {
        sky1.anchorPoint = CGPoint(x: 0, y: 0)
        sky1.position = CGPoint(x: 0, y: 0)
        sky1.zPosition = -15
        sky1.size.width = size.width
        sky1.size.height = size.height
        worldNode.addChild(sky1)
        
        sky2.anchorPoint = CGPoint(x: 0, y: 0)
        sky2.position = CGPoint(x: sky1.size.width, y: 0)
        sky2.zPosition = -15
        sky2.size.width = size.width
        sky2.size.height = size.height
        worldNode.addChild(sky2)
    }
    
    func setUpClouds() {
        clouds1.anchorPoint = CGPoint(x: 0, y: 0)
        clouds1.position = CGPoint(x: 0, y: 0)
        clouds1.zPosition = -14
        clouds1.size.height = size.height * (3/4)
        clouds1.size.width = clouds1.size.height * 9.1101
        worldNode.addChild(clouds1)
        
        clouds2.anchorPoint = CGPoint(x: 0, y: 0)
        clouds2.position = CGPoint(x: clouds1.size.width, y: size.height * (1/3))
        clouds2.zPosition = -14
        clouds2.size.height = size.height * (3/4)
        clouds2.size.width = clouds2.size.height * 9.1101
        worldNode.addChild(clouds2)
    }
    
    func setUpPlayer() {
        let player:Player = Player()
        player.initPlayer()
        player.position = CGPoint(x: size.width * (1/4), y: size.height * (1/3))
        worldNode.addChild(player)
    }
    
    func setUpEnvironment() {
        // TODO: Chose environment to load from startScene?
        let platformHeight = size.height/50
        createPlatform(position: CGPoint(x: size.width/2, y: platformHeight/2), size: CGSize(width: size.width, height: platformHeight))
    }
    
    func createPlatform(position: CGPoint, size: CGSize) {
        let platform: SKSpriteNode = SKSpriteNode(imageNamed: "")
        platform.position = position
        platform.size = size
        platform.zPosition = 5
        platform.name = GameData.shared.platformName
        
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size)
        platform.physicsBody?.affectedByGravity = false
        platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player | PhysicsCategory.Enemy
        platform.physicsBody?.collisionBitMask = PhysicsCategory.Player | PhysicsCategory.Enemy
        worldNode.addChild(platform)
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

// PROTOCOLS
protocol Entity {
    var health: Int {get set}
    
    static func uid() -> String
}

extension Entity {
    static func uid() -> String {
        return UUID().uuidString
    }
}

protocol ObjectThatMoves: Entity {
    var moveSpeed: Int {get set}
    func move()
}

protocol ObjectThatAttacks: Entity {
    func attack()
}

protocol ObjectThatJumps: Entity{
    var jumpHeight: Int {get set}
    func jump()
}








