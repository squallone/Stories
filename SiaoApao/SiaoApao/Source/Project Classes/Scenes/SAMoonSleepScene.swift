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
    let totatDurationAnimation: TimeInterval = 3.0
    
    // MARK: - Sound
    let cricketSound: SKAction = SKAction.playSoundFileNamed(
        "cricket.wav", waitForCompletion: true)
    
    // MARK: - Points
    var startYPosition: CGFloat = 0.0
    var finishYposition: CGFloat = 610.0
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        moonNode = self.childNode(withName: "moon") as? SKSpriteNode
        darkNode = self.childNode(withName: "dark") as? SKSpriteNode
        
        /* Soud Moon */
        moonNode?.run(SKAction.repeatForever(cricketSound))
        
        let waitAction = SKAction.wait(forDuration: 1.0)
        let moonAction = SKAction.customAction(withDuration: totatDurationAnimation) { (node, elapsedTime) in
            let alphaValue = elapsedTime / CGFloat(self.totatDurationAnimation)
            
            /* Set the dark Node alpha */
            self.darkNode?.alpha = 1 - alphaValue
            
            /* Set the new position */
            let yPosition = elapsedTime * (self.finishYposition / CGFloat(self.totatDurationAnimation))
            let newPoint = CGPoint(x: (self.moonNode?.position.x)!, y:yPosition)
            self.moonNode?.position = newPoint
        }
        
        let sequenceArray = [waitAction, moonAction]

        let sequenceAction = SKAction.sequence(sequenceArray)
        run(sequenceAction) {
            print("Show next")
        }
    }
}
