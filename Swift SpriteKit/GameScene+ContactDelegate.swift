//
//  GameScene+ContactDelegate.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2025/02/05.
//

import Foundation
import SpriteKit
import GameplayKit

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity,
              let entityB = contact.bodyB.node?.entity else {
            return
        }
        
        handleEnemyContactWithPlayer(entityA: entityA, entityB: entityB)
        handleEnemyContactWithPlayer(entityA: entityB, entityB: entityA)
        
        handleEnemyContactWithGround(entityA: entityA, entityB: entityB)
        handleEnemyContactWithGround(entityA: entityB, entityB: entityA)
        
    }
    func handleEnemyContactWithPlayer(entityA: GKEntity, entityB: GKEntity) {
        if entityA is PlayerEntity && entityB is EnemyEntity {
            entityA.component(ofType: HurtComponent.self)?.playAnim()
            entityB.component(ofType: HurtComponent.self)?.playAnim()
        }
    }
    
    func handleEnemyContactWithGround(entityA: GKEntity, entityB: GKEntity) {
        if (entityA is GroundEntity || entityA is EnemyEntity) && entityB is EnemyEntity {
            entityB.component(ofType: HurtComponent.self)?.playAnim()
        }
    }
}
