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
    var score: SKLabelNode!
    var playAgain: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        gameOverLabel = SKLabelNode(fileNamed: "gameOverLabel")
        
        score = SKLabelNode(fileNamed: "score")
        
       // score.text = String(ScoreBoard.Score)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodeArray = self.nodes(at: location)
            
            if nodeArray.first?.name == "playAgain" {
                
                if let gameScene = GameScene(fileNamed: "GameScene") {
                    gameScene.scaleMode = .aspectFill
                    view?.presentScene(gameScene)
                }
                
            }
            
            if nodeArray.first?.name == "quit" {
                
                exit(0)
                
            }
        }
    
    }
        
        

        
}

