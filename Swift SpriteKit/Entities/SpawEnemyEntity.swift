
import Foundation
import GameplayKit
import SpriteKit

class SpawEnemyEntity: GKEntity {
    init(entityManager: SKEntityManager) {
        super.init()
        let node = SKNode()
        self.addComponent(GKSKNodeComponent(node: node))
        node.run(.repeatForever(.sequence([
            .wait(forDuration: 2),
            .run{
                let newEnemy = EnemyEntity(position: .init(x: .random(in: -300...300), y: 1700), entityManager: entityManager)
                entityManager.add(entity: newEnemy)
            }
        ])))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
