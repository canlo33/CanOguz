import SpriteKit
import GameplayKit

class Island : GameObject {
    
    var plane: Plane?
    

    // Initializers
    init() {
        super.init(imageString: "blackhole1", initialScale: 2.0)
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // class functions
    
    override func Start() {
        self.verticalSpeed = 10
        self.zPosition = 1
        self.Reset()
        plane = Plane()
    }
    
    override func Reset() {
        self.isColliding = false
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
        self.CheckBounds()
        self.zRotation = self.zRotation - 0.4
        let distance = CGPoint.Distance(P1: self.position, P2: plane!.position)
        if (Float(distance) <= 700) {
         
            if((plane!.position.x - self.position.x) < 0) {
                print("Move Right")
                plane!.position.x += 200
                print(plane!.position.x)
            }
            
           else if((plane!.position.x - self.position.x) >= 0) {
                print("Move Left")
                plane!.position.x += -200
                print(plane!.position.x)
            }
        }
        
    
    }
}
