//
//  SAIntroScene.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/22/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAIntroScene: SABaseScene {

    override func didMove(to view: SKView) {
        //super.didMove(to: view)
        
        // Next button
        let nextButton = SKSpriteNode(imageNamed: "RightArrow")
        nextButton.name = "next"
        nextButton.position = CGPoint(x: size.width-65, y: 65)
        nextButton.zPosition = 10
        addChild(nextButton)
    
        showNextButton()
    
    }
}
