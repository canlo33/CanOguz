//
//  Bullet.swift
//  MAPD724-W2019-Lesson2
//
//  Created by Đậu Thư on 2019-02-19.
//  Copyright © 2019 CentennialCollege. All rights reserved.
//

import SpriteKit
import GameplayKit

class Bullet : GameObject {
    
    init() {
        super.init(imageString: "bullet", initialScale: 0.65)
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func Start() {
        self.verticalSpeed = 15.0
        self.zPosition = 3
        
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
        self.position.y += self.verticalSpeed!
        
    }
}

