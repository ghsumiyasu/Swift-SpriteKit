//
//  EnemyEntity.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2025/02/05.
//

import Foundation
import SpriteKit
import GameplayKit

class EnemyEntity: GKEntity {
    init(position: CGPoint = .zero, entityManager: SKEntityManager) {
        super.init()
        let node = SKSpriteNode(imageNamed: "Rock Head1")
        node.position = position
        self.addComponent(GKSKNodeComponent(node: node))
        let body = SKPhysicsBody(rectangleOf: .init(width: 320, height: 320))
        body.categoryBitMask = .enemy
        body.contactTestBitMask = .contactWithAllCategories()
        body.restitution = 0
        self.addComponent(PhysicsComponent(physicsBody: body))
        let hurtAnim = SKAction.sequence([
            .animate(with: .init(withFormat: "Rock Head%@", range: 1...4), timePerFrame: 0.1),
            .fadeOut(withDuration: 0.1),
            .run { [weak self] in
                guard let self else { return }
                entityManager.remove(entity: self)
            }
            ])
        self.addComponent(HurtComponent(animation: hurtAnim))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if let node = self.component(ofType: GKSKNodeComponent.self)?.node {
            node.removeFromParent()
        }
    }
}
