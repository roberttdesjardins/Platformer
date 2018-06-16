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
    
    override func didMove(to view: SKView) {
        createBackground()
        createUI()
    }
    
    
    func createBackground() {
        background = SKSpriteNode(imageNamed: "sky")
        background.zPosition = 1
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
    }
    
    func createUI() {
        createStartButton(width: frame.size.width/2, height: frame.size.height/2)
    }
    
    func createStartButton(width: CGFloat, height: CGFloat) {
        backgroundColor = SKColor.white
        let buttonTexture: SKTexture! = SKTexture(imageNamed: "ButtonNotPressed")
        let buttonTextureSelected: SKTexture! = SKTexture(imageNamed: "ButtonPressed")
        //TODO: Put in disabled texture
        let startButton = FTButtonNode(normalTexture: buttonTexture, selectedTexture: buttonTextureSelected, disabledTexture: buttonTexture)
        startButton.setButtonAction(target: self, triggerEvent: .TouchUpInside, action: #selector(StartScene.startButtonTap))
        startButton.setButtonLabel(title: "Start!", font: "Arial", fontSize: 12)
        startButton.position = CGPoint(x: self.frame.midX,y: self.frame.midY)
        startButton.zPosition = 2
        startButton.name = "StartButton"
        self.addChild(startButton)
    }
    
    @objc func startButtonTap() {
        playButtonPress()
        gameSceneLoad(view: view!)
    }
    
    
}
