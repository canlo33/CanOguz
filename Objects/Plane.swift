import SpriteKit
import GameplayKit

class Plane : GameObject {
    
    init() {
        super.init(imageString: "player", initialScale: 0.1)
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.zPosition = 2
    }
    
    
    override func CheckBounds() {
        // check the right boundary
        if(self.position.x > screenSize.width - self.halfWidth!) {
            self.position.x = screenSize.width - self.halfWidth!
        }
        
        // check the left boundary
        if(self.position.x < -screenSize.width + self.halfWidth!) {
            self.position.x = -screenSize.width + self.halfWidth!
        }
    }
    
    override func Update() {
        CheckBounds()
    }
}
