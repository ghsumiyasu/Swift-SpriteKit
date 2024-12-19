//
//  GameScene.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2024/12/17.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    private var lastUpdateTime : TimeInterval = 0

    override func update(_ currentTime: TimeInterval) {
        
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        let dt = currentTime - self.lastUpdateTime
            
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        self.lastUpdateTime = currentTime
    }
}
