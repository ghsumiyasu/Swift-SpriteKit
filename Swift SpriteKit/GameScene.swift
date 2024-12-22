//
//  GameScene.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2024/12/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }

    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
