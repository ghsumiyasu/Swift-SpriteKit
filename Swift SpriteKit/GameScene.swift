//
//  GameScene.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2024/12/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager: SKEntityManager?
    private var lastUpdateTime : TimeInterval = 0
    weak var playerEntity: PlayerEntity?
    
    override func sceneDidLoad() {
        entityManager = SKEntityManager(scene: self)
        
        self.physicsWorld.contactDelegate = self
        
        let playerEntity = PlayerEntity(entityManager: entityManager!)
        entityManager?.add(entity: playerEntity)
        self.playerEntity = playerEntity
        
        let scenarioEntity = ScenarioEntity(named: "Level01.sks", entityManager: entityManager!)
        entityManager?.add(entity: scenarioEntity)
        
        let cameraNode = SKCameraNode()
        self.addChild(cameraNode)
        self.camera = cameraNode
        self.camera?.setScale(2.5)
        
        let spawEnemies = SpawEnemyEntity(entityManager: entityManager!)
        entityManager?.add(entity: spawEnemies)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        captureInput(touches: touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        playerEntity?.movementComponent?.change(direction: .none)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        captureInput(touches: touches)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        let dt = currentTime - self.lastUpdateTime
            
        if let entities = entityManager?.entities {
            for entity in entities {
                entity.update(deltaTime: dt)
            }
        }
        
        self.lastUpdateTime = currentTime
    }
    public  func captureInput(touches: Set<UITouch>) {
        if let location = touches.first?.location(in: self) {
            if location.x <= 0 {
                playerEntity?.movementComponent?.change(direction: .left)
            } else {
                playerEntity?.movementComponent?.change(direction: .right)
            }
        }
    }
}
