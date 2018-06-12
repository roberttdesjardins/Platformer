//
//  Helpers.swift
//  Platformer
//
//  Created by Robert Desjardins on 2018-06-09.
//  Copyright © 2018 Robert Desjardins. All rights reserved.
//

import SpriteKit
import Foundation
import AVFoundation

private var buttonSoundPlayer: AVAudioPlayer!

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}

func random() -> CGFloat {
    return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
}

func random(min: CGFloat, max: CGFloat) -> CGFloat {
    return random() * (max - min) + min
}

func random(min: Double, max: Double) -> Double {
    return Double(random()) * (max - min) + min
}


func gameSceneLoad(view: UIView) {
    let scene = GameScene(size: view.bounds.size)
    let skView = view as! SKView
    skView.ignoresSiblingOrder = true
    scene.scaleMode = .resizeFill
    skView.showsFPS = false
    skView.showsNodeCount = false
    skView.presentScene(scene, transition: SKTransition.doorsCloseHorizontal(withDuration: 1.0))
}

func playButtonPress() {
    let path = Bundle.main.path(forResource: "Free-GUI-Buttons-039", ofType: "wav")!
    let url = URL(fileURLWithPath: path)
    do {
        buttonSoundPlayer = try AVAudioPlayer(contentsOf: url)
        buttonSoundPlayer.numberOfLoops = 0
        buttonSoundPlayer.prepareToPlay()
    } catch let error as NSError {
        print(error.description)
    }
    buttonSoundPlayer.play()
}
