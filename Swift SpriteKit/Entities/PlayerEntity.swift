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
        let node = SKSpriteNode(color: .orange, size: .init(width: 100, height: 100))
        self.addComponent(GKSKNodeComponent(node: node))
        
        let moveComp = MovementComponent(speed: 5)
        self.addComponent(moveComp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
