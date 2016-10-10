//
//  CGFloat+Action.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 09/10/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGFloat {

    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max))
    }
    
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}
