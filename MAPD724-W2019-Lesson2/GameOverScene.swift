//
//  GameOverScene.swift
//  MAPD724-W2019-Lesson2
//
//  Created by Đậu Thư on 2019-02-20.
//  Copyright © 2019 CentennialCollege. All rights reserved.
//
import SpriteKit
import GameplayKit
import UIKit
import AVFoundation


class GameOverScene: SKScene {
    
    var gameOverLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        gameOverLabel = SKLabelNode(fileNamed: "gameOverLabel")
    }
}
