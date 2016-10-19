//
//  SAEndScene.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 08/10/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAEndScene: SABaseScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.nextButton?.texture = SKTexture(imageNamed: "home")
    }

}
