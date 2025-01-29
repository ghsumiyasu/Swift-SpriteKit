//
//  SKTexture+Array.swift
//  Swift SpriteKit
//
//  Created by Desenvolvimento on 2025/01/29.
//

import Foundation
import SpriteKit

extension Array where Element == SKTexture {
    init (withFormat format: String, range: ClosedRange<Int>) {
        self = range.map({ (Index) in
            let imageNamed = String(
                format: format, "\(Index)")
            let texture = SKTexture(imageNamed: imageNamed)
            texture.filteringMode = .nearest
            return texture
        })
    }
}
