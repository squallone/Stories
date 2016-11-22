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
        let background = SKShapeNode(rect: CGRect(x: 525, y: 140, width: 400, height: 115), cornerRadius: 10)
        background.fillColor = UIColor(white: 1.0, alpha: 0.8)
        background.zPosition = 1
        
        self.addChild(background)
        
        self.nextButton?.texture = SKTexture(imageNamed: "home")
        showNextButton()
    
    }
}
