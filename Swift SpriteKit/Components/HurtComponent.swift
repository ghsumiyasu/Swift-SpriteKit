
import Foundation
import SpriteKit
import GameplayKit

class HurtComponent: GKComponent {
    var animation: SKAction
    var node: SKNode?
    init(animation: SKAction) {
        self.animation = animation
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didAddToEntity() {
        node = entity?.component(ofType: GKSKNodeComponent.self)?.node
    }
    
    func playAnim() {
        node?.run(animation)
    }
}
