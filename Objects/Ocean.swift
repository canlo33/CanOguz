import SpriteKit
import GameplayKit

class Ocean : GameObject {
    // Initializers
    init() {
        // initialize the object with an image
        super.init(imageString: "space", initialScale: 2.0)
    
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        //print(self.width)
        //print("Screen Width: \(screenWidth)")
        
        self.verticalSpeed = 10.0
        self.Reset()
    }
    
    override func Reset() {
        self.zPosition = 0
        //self.position.y = 772
        self.position.y = 3652
    }
    
    override func CheckBounds() {
        //if(self.position.y <= -772) {
        if(self.position.y <= -2108) {
            self.Reset()
        }
    }
    
    override func Update() {
        self.position.y -= self.verticalSpeed!
        self.CheckBounds()
    }
    
}
