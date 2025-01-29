//
//  PlayerEntity.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2024/12/22.
//

import Foundation
import SpriteKit
import GameplayKit

class PlayerEntity: GKEntity {
    
    var movementComponent: MovementComponent? {
        return component(ofType: MovementComponent.self)
    }
    
    override init() {
        super.init()
        let node = SKSpriteNode(imageNamed: "idle1.png")
        node.anchorPoint = .init(x: 0.46, y: 0)
        node.setScale(2)
        self.addComponent(GKSKNodeComponent(node: node))
        
        let animationComp = AnimationComponent(
            idleAction: .repeatForever(.animate(with: .init(withFormat: "idle%@.png",
                range: 1...6), timePerFrame: 0.1)),
            runAction: .repeatForever(.animate(with: .init(withFormat: "run%@.png",
                range: 1...12), timePerFrame: 0.1)))
        self.addComponent(animationComp)
        
        let moveComp = MovementComponent(speed: 5)
        self.addComponent(moveComp)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
