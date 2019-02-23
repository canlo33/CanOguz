import CoreGraphics
import SpriteKit

class Collision {
    
    public static func check(scene: SKScene, object1: GameObject, object2: GameObject) {
        let distance = CGPoint.Distance(P1: object1.position, P2: object2.position)
        
        
        if(distance < (object1.halfHeight! + object2.halfHeight!)) {
            if(!object2.isColliding!) {
                object2.isColliding = true
                
                
                switch(object2.name) {
                case "blackhole1":
                    
                    print("BLACKHOLE", object1.name! + " " + object2.name!)
                    
                case "asteroid":
                    
                    if(object2.alpha == 1){
                       // object2.alpha = 0
                        print("Game Over")
                    
                    }
                    print("ASTEROID", object1.name! + " " + object2.name!)
                case "bullet":
                    // Game over
                    
                    print(object1.name! + " DESTROYED")
                    print(object2.name! + " DESTROYED2222")
                    

                    
                    if(object1.alpha == 1){
                        object2.alpha = 0
                        object1.alpha = 0
                    }
                    else if(object1.alpha == 0){
                        object2.alpha = 1
                    }
                    

 
            
                    //print("BULLET", object1.name! + " " + object2.name!)
                default:
                    print("ERROR: Collision with something else")
                }
            }
        }
    }

    public static func gameOverCheck(scene: SKScene, object1: GameObject, object2: GameObject)-> Bool {
        let distance = CGPoint.Distance(P1: object1.position, P2: object2.position)
        if(distance < (object1.halfHeight! + object2.halfHeight!)) {
            if(!object2.isColliding!) {
                object2.isColliding = true
            }
            if((object2.name! == "asteroid") || (object2.name! == "blackhole1") ) {
                return true
            }
            else {
                return false
            }
        
        }
        return false
    }
}
