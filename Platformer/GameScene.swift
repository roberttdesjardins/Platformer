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
    
    var platformArr: [SKSpriteNode] = []
    
    // Background
    var skyArr: [SKSpriteNode] = []
    var cloudsArr: [SKSpriteNode] = []
    var seaArr: [SKSpriteNode] = []
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        addChild(worldNode)
        self.lastUpdateTime = 0
        setUpBackground()
        setUpPlayer()
        setUpEnvironment()
    }
    
    func setUpBackground() {
        setUpSky()
        setUpClouds()
        setUpSea()
    }
    
    func setUpSky() {
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
        print("SkyCount = \(skyCount)")
    }
    
    func setUpClouds() {
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
        print("cloudsCount = \(cloudsCount)")
    }
    
    func setUpSea() {
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
        print("SeaCount = \(seaCount)")
    }
    
    func setUpPlayer() {
        let player:Player = Player()
        player.initPlayer()
        player.position = CGPoint(x: size.width * (1/4), y: size.height * (1/3))
        worldNode.addChild(player)
    }
    
    func setUpEnvironment() {
        // TODO: Chose environment to load from startScene?
        let platformHeight = size.height / 5
        let platformWidth = platformHeight * 1.28947
        createPlatform(position: CGPoint(x: size.width/4, y: platformHeight/2), size: CGSize(width: platformWidth, height: platformHeight))
    }
    
    func createPlatform(position: CGPoint, size: CGSize) {
        let platform: SKSpriteNode = SKSpriteNode(imageNamed: "platform")
        platform.position = position
        platform.size = size
        platform.zPosition = 0
        platform.name = GameData.shared.platformName
        
        platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size - CGSize(width: 0, height: 10))
        platform.physicsBody?.isDynamic = false
        platform.physicsBody?.affectedByGravity = false
        platform.physicsBody?.categoryBitMask = PhysicsCategory.Platform
        platform.physicsBody?.contactTestBitMask = PhysicsCategory.Player | PhysicsCategory.Enemy
        platform.physicsBody?.collisionBitMask = PhysicsCategory.Player | PhysicsCategory.Enemy
        worldNode.addChild(platform)
        platformArr.append(platform)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO: If player is touching a platform, preform a jump
        if let player = worldNode.childNode(withName: GameData.shared.playerName) as? Player {
            print("Testing for platform")
            for platform in platformArr {
                print ("Found a platform")
                if (player.physicsBody?.allContactedBodies().contains(platform.physicsBody!))! {
                    player.jump()
                }
            }
            
        }
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
    var isAlive: Bool {get set}
    
    static func uid() -> String
    mutating func hitTaken()
}

extension Entity {
    static func uid() -> String {
        return UUID().uuidString
    }
    mutating func hitTaken() {
        if health > 0 {
            health -= 1
            if health == 0 {
                isAlive = false
            }
        } else {
            isAlive = false
        }
    }
}

protocol ObjectThatMoves: Entity {
    var moveSpeed: Int {get set}
    func move()
}

protocol ObjectThatAttacks: Entity {
    var attackDamage: Int {get set}
    func attack()
}

protocol ObjectThatJumps: Entity{
    var jumpHeight: Int {get set}
    func jump()
}
