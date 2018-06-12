//
//  StartScene.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-12.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import Foundation
import SpriteKit

class StartScene: SKScene {
    var background = SKSpriteNode()
    var startButton: SKSpriteNode! = nil
    
    override func didMove(to view: SKView) {
        createBackground()
        createUI()
    }
    
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "") // TODO
        background.zPosition = 1
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
    }
    
    func createUI() {
        createStartButton(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    }
    
    func createStartButton(width: CGFloat, height: CGFloat) {
        startButton = SKSpriteNode(imageNamed: "") // TODO
        startButton.zPosition = 2
        startButton.size = CGSize(width: width, height: height)
        addChild(startButton)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        if startButton.contains(touchLocation) {
            playButtonPress()
            gameSceneLoad(view: view!)
        }
    }
}
