//
//  SKScene+CommonOperations.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 18/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

extension SKScene {
    
    /* Method to transform degrees in Radians */
    func degToRad(_ degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
}

