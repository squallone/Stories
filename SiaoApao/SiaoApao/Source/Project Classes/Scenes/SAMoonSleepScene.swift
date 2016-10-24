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
        
        self.hideLabels()

        self.updateLocalizableString()
        
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

            self.showLabels()
            
            self.label1.position = CGPoint(x: 440, y: 205)
            self.label2.position = CGPoint(x: 440, y: 170)
            self.label3.position = CGPoint(x: 440, y: 135)
            self.label4.position = CGPoint(x: 440, y: 100)
            
            let background       = SKSpriteNode()
            background.color     = UIColor(white: 1.0, alpha: 0.8)
            background.size      = CGSize(width: 420, height: 115)
            background.position  = CGPoint(x: 640, y: 180)
            background.zPosition = 10
            self.addChild(background)
            
            self.showNextButton()
        }
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_sleeping_instructions".localized
        label1.text = "scene_sleeping_text1".localized
        label2.text = "scene_sleeping_text2".localized
        label3.text = "scene_sleeping_text3".localized
        label4.text = "scene_sleeping_text4".localized
    }
}
