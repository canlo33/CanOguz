import SpriteKit
import GameplayKit

class Cloud : GameObject {
    
    // Initializers
    init() {
        super.init(imageString: "asteroid", initialScale: 0.3)
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // class functionsmkmj
    
    override func Start() {
        self.alpha = 1
        
        self.Reset()
    }
    
    override func Reset() {
        self.isColliding = false
        self.zPosition = 3
        self.alpha = 1
        //let newScale = (self.randomSource?.nextUniform())! + 1.0
        //self.setNewScale(scale: CGFloat(newScale))
        self.verticalSpeed = CGFloat(((self.randomSource?.nextInt(upperBound: 10))!) + 10)
        self.horizontalSpeed = CGFloat((self.randomSource?.nextInt(upperBound: 4))! - 2)
        self.position.y = 654 + self.height!
        let randomX:Int =
            (self.randomSource?.nextInt(upperBound: (Int(screenSize.width * 2.0))))! - Int(screenSize.width)
        self.position.x = CGFloat(randomX)
    }
    
    override func CheckBounds() {
        // check the lower bounds
        if(self.position.y < -2108 - self.height! ) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.verticalSpeed!
        self.position.x -= self.horizontalSpeed!
        self.CheckBounds()
    }
}
