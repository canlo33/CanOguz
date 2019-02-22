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


class MenuScene: SKScene {
    
    var ocean1: Ocean?
    var ocean2: Ocean?
    var newGame = SKLabelNode(text: "New Game")
    var credits = SKLabelNode(text: "Credits")
    var oguz = SKLabelNode(text: "Oguz Bayral")
    var can = SKLabelNode(text: "Can Lo")
    
    override func didMove(to view: SKView) {
        
        ocean1 = Ocean()
        addChild(ocean1!)
        
        // add the ocean2 to scene
        ocean2 = Ocean()
        ocean2?.position.y = 772
        ocean2?.zPosition = 0
        addChild(ocean2!)
        
        newGame.name = "newGame"
        newGame.position = CGPoint(x: 0.0, y: 135)
        newGame.fontColor = UIColor.green
        newGame.fontSize = 48.0
        newGame.zPosition = 5
        newGame.fontName = "Arial"
        addChild(newGame)
        
        credits.name = "credits"
        credits.position = CGPoint(x: 0.0, y: -135)
        credits.fontColor = UIColor.blue
        credits.fontSize = 48.0
        credits.zPosition = 5
        credits.fontName = "Arial"
        addChild(credits)
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        ocean1?.Update()
        ocean2?.Update()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodeArray = self.nodes(at: location)
            
            if nodeArray.first?.name == "newGame" {

                if let gameScene = GameScene(fileNamed: "GameScene") {
                    gameScene.scaleMode = .aspectFill
                    view?.presentScene(gameScene)
                }
                
            }
            
            if nodeArray.first?.name == "credits" {
                
                can.removeFromParent()
                oguz.removeFromParent()
                
                can.name = "can"
                can.position = CGPoint(x: -170.0, y: -250)
                can.fontColor = UIColor.green
                can.fontSize = 48.0
                can.zPosition = 5
                can.fontName = "Arial"
                addChild(can)
                
                oguz.name = "oguz"
                oguz.position = CGPoint(x: 130.0, y: -250)
                oguz.fontColor = UIColor.green
                oguz.fontSize = 48.0
                oguz.zPosition = 5
                oguz.fontName = "Arial"
                addChild(oguz)
                
            
                
            }
        }
        
    }
    
}

