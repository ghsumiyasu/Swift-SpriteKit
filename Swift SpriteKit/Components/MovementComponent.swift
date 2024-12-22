//
//  MovementComponent.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2024/12/22.
//

import Foundation
import SpriteKit
import GameplayKit

enum Direction: CGFloat {
    case right = 1
    case left = -1
    case none = 0
}

class MovementComponent: GKComponent {
    
    var node: SKNode?
    var speed: CGFloat
    var direction: Direction = .none

    init(speed: CGFloat) {
        self.speed = speed
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        node = entity?.component(ofType: GKSKNodeComponent.self)?.node
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        node?.position.x += direction.rawValue * speed
    }
    
    public func change(direction: Direction) {
        self.direction = direction
    }
}
