import CoreGraphics
import SpriteKit

class Collision {
    
    public static func check(scene: SKScene, object1: GameObject, object2: GameObject) {
        let distance = CGPoint.Distance(P1: object1.position, P2: object2.position)
        
        
        if(distance < (object1.halfHeight! + object2.halfHeight!)) {
            if(!object2.isColliding!) {
                object2.isColliding = true
            
            
                switch(object2.name) {
                    case "island":
                        ScoreBoard.Score += 100
                        scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    case "cloud":
                        // Game over
                        ScoreBoard.Lives -= 1
                        scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    default:
                        print("ERROR: Collision with something else")
                }
            }
        }
    }
}
