
import Foundation
import SpriteKit
import GameplayKit

class ScenarioEntity: GKEntity {
    init(named: String) {
        super.init()
        if let scenarioNode = SKReferenceNode(fileNamed: named) {
            self.addComponent(GKSKNodeComponent(node: scenarioNode))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
