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
//    let sky1 = SKSpriteNode(imageNamed: "sky")
//    let sky2 = SKSpriteNode(imageNamed: "sky")
    var skyArr: [SKSpriteNode] = []
//    let clouds1 = SKSpriteNode(imageNamed: "clouds")
//    let clouds2 = SKSpriteNode(imageNamed: "clouds")
    var cloudsArr: [SKSpriteNode] = []
//    let sea1 = SKSpriteNode(imageNamed: "sea")
//    let sea2 = SKSpriteNode(imageNamed: "sea")
    var seaArr: [SKSpriteNode] = []
    
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
        setUpSea()
    }
    
    func setUpSky() {
//        sky1.anchorPoint = CGPoint(x: 0, y: 0)
//        sky1.position = CGPoint(x: 0, y: 0)
//        sky1.zPosition = -15
//        sky1.size.width = size.width
//        sky1.size.height = size.height
//        worldNode.addChild(sky1)
//
//        sky2.anchorPoint = CGPoint(x: 0, y: 0)
//        sky2.position = CGPoint(x: sky1.size.width, y: 0)
//        sky2.zPosition = -15
//        sky2.size.width = size.width
//        sky2.size.height = size.height
//        worldNode.addChild(sky2)
        let skyHeight = size.height
        let skyWidth = skyHeight * 0.3684
        var skyCount = 0
        while CGFloat(skyArr.count) * skyWidth < size.width * 1.5 {
            let sky = SKSpriteNode(imageNamed: "sky")
            sky.anchorPoint = CGPoint(x: 0, y: 0)
            sky.position = CGPoint(x: skyCount * Int(skyWidth), y: 0)
            sky.zPosition = -15
            sky.size.width = skyWidth
            sky.size.height = skyHeight
            worldNode.addChild(sky)
            skyArr.append(sky)
            skyCount = skyCount + 1
        }
    }
    
    func setUpClouds() {
//        clouds1.anchorPoint = CGPoint(x: 0, y: 0)
//        clouds1.position = CGPoint(x: 0, y: 0)
//        clouds1.zPosition = -14
//        clouds1.size.height = size.height * (3/4)
//        clouds1.size.width = clouds1.size.height * 9.1101
//        worldNode.addChild(clouds1)
//
//        clouds2.anchorPoint = CGPoint(x: 0, y: 0)
//        clouds2.position = CGPoint(x: clouds1.size.width, y: 0)
//        clouds2.zPosition = -14
//        clouds2.size.height = size.height * (3/4)
//        clouds2.size.width = clouds2.size.height * 9.1101
//        worldNode.addChild(clouds2)
        let cloudsHeight = size.height * (3/4)
        let cloudsWidth = cloudsHeight * 2.3050
        var cloudsCount = 0
        while CGFloat(cloudsArr.count) * cloudsWidth < size.width * 1.5 {
            let cloud = SKSpriteNode(imageNamed: "clouds")
            cloud.anchorPoint = CGPoint(x: 0, y: 0)
            cloud.position = CGPoint(x: cloudsCount * Int(cloudsWidth), y: 0)
            cloud.zPosition = -14
            cloud.size.width = cloudsWidth
            cloud.size.height = cloudsHeight
            worldNode.addChild(cloud)
            cloudsArr.append(cloud)
            cloudsCount = cloudsCount + 1
        }
    }
    
    func setUpSea() {
//        sea1.anchorPoint = CGPoint(x: 0, y: 0)
//        sea1.position = CGPoint(x: 0, y: 0)
//        sea1.zPosition = -13
//        sea1.size.height = size.height * (7/24)
//        sea1.size.width = sea1.size.height * 11.6666
//        worldNode.addChild(sea1)
//
//        sea2.anchorPoint = CGPoint(x: 0, y: 0)
//        sea2.position = CGPoint(x: sea1.size.width, y: 0)
//        sea2.zPosition = -13
//        sea2.size.height = size.height * (7/24)
//        sea2.size.width = sea2.size.height * 11.6666
//        worldNode.addChild(sea2)
        let seaHeight = size.height * (7/24)
        let seaWidth = seaHeight * 1.166
        var seaCount = 0
        while CGFloat(seaArr.count) * seaWidth < size.width * 1.5 {
            let sea = SKSpriteNode(imageNamed: "sea")
            sea.anchorPoint = CGPoint(x: 0, y: 0)
            sea.position = CGPoint(x: seaCount * Int(seaWidth), y: 0)
            sea.zPosition = -13
            sea.size.width = seaWidth
            sea.size.height = seaHeight
            worldNode.addChild(sea)
            seaArr.append(sea)
            seaCount = seaCount + 1
        }
        
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








