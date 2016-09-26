//
//  SKAction+Custom.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 25/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

extension SKAction {

    open class func bounce(to scale: CGFloat, duration sec: TimeInterval) -> SKAction {
        /* Create Bounce Action */
        let scaleAction = SKAction.scale(by: scale, duration: sec)
        let reversedAcion = scaleAction.reversed()
        
        /* Create Squence action and repeat it forever */
        let nodeSequence = SKAction.sequence([scaleAction, reversedAcion])
        return nodeSequence
    }
}


