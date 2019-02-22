import CoreMotion
import SpriteKit
import GameplayKit
import UIKit
import AVFoundation

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    public var isGameOver:Bool = false
    var plane: Plane?
    var cloud: Cloud?
    var ocean1: Ocean?
    var ocean2: Ocean?
    var island: Island?
    var bullet: Bullet?
    var bulletList : Array<Bullet> = Array()
    
    var clouds: [Cloud] = []
    var cloudNum: Int = 3
    
    var motionManager = CMMotionManager()
    var destX:CGFloat  = 0.0
    
    var degToRad = 0.01745329252
    
    
    override func didMove(to view: SKView) {
        
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add the ocean1 to scene
        ocean1 = Ocean()
        addChild(ocean1!)
        
        // add the ocean2 to scene
        ocean2 = Ocean()
        ocean2?.position.y = 772
        ocean2?.zPosition = 0
        addChild(ocean2!)
        
        island = Island()
        addChild(island!)
        
        // add plane to scene
        plane = Plane()
        plane?.position = CGPoint(x: 0.0, y: -500.0)
        addChild(plane!)
        
        print(screenSize.width)
        
        print(screenSize.height)
        
        if motionManager.isAccelerometerAvailable {
            // 2
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: .main) {
                (data, error) in
                guard let data = data, error == nil else {
                    return
                }
                
                // 3
                let currentX = self.plane!.position.x
                self.destX = currentX + CGFloat(data.acceleration.x * 1000)
                
            }
        }
        
        
        
        // adds multiple clouds to the scene
        for index in 0...self.cloudNum - 1 {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            self.addChild(clouds[index])
        }
        
   
       
        
        ScoreBoard.ScoreLabel.position.x = 0
        ScoreBoard.ScoreLabel.position.y = (screenSize.height * 0.5) + 90
        ScoreBoard.ScoreLabel.fontColor = UIColor.yellow
        ScoreBoard.ScoreLabel.fontSize = 48.0
        ScoreBoard.ScoreLabel.zPosition = 5
        ScoreBoard.ScoreLabel.fontName = "Arial"
        ScoreBoard.Score = 0
        
        
        addChild(ScoreBoard.ScoreLabel)
    
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
      
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
   
        bullet = Bullet()
        bulletList.append(bullet!)
        
        bullet?.position = plane!.position
        addChild(bullet!)
 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean1?.Update()
        ocean2?.Update()
        island?.Update()
       
        plane?.Update()
        let action = SKAction.moveTo(x: destX, duration: 0.4)
        
        plane?.run(action)
        plane?.CheckBounds()
        
      //  let distance = CGPoint.Distance(P1: plane!.position, P2: island!.position)
        bullet?.Update()
        ScoreBoard.Score += 1
        
        
        Collision.check(scene: self, object1: plane!, object2: island!)
        
        
        for cloud in clouds {
            cloud.Update()
            Collision.check(scene: self, object1: plane!, object2: cloud)
            if(Collision.gameOverCheck(scene: self, object1: plane!, object2: cloud) && cloud.alpha == 1) {
                
                
               // UserDefaults.standard.set(String(ScoreBoard.Score), forKey: "HighScore")
                
                
                if let gameOverScene = GameOverScene(fileNamed: "GameOverScene") {
                    gameOverScene.scaleMode = .aspectFill
                    view?.presentScene(gameOverScene)
                }
              
                
        
            }
        }
 
        
        for bullet in bulletList {
            for cloud in clouds {
                bullet.Update()
                Collision.check(scene: self, object1: cloud, object2: bullet)
               
            }
        }
        
    }
    
}
