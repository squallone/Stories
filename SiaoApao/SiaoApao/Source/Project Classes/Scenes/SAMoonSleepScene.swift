//
//  SAMoonSleepScene.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 08/10/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAMoonSleepScene: SABaseScene {
    
    // MARK: - Properties
    var moonNode: SKSpriteNode?
    var darkNode: SKSpriteNode?
    
    let liquidSound: SKAction = SKAction.playSoundFileNamed(
        "cricket.wav", waitForCompletion: true)
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        moonNode = self.childNode(withName: "moon") as? SKSpriteNode
        darkNode = self.childNode(withName: "dark") as? SKSpriteNode
    }
}
