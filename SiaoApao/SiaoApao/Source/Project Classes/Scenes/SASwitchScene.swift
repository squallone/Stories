//
//  SASwitchScene.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 08/10/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SASwitchScene: SABaseScene {

    // MARK: - Properties
    var switchNode: SKSpriteNode?
    var darkNode: SKSpriteNode?
    let switchSound: SKAction = SKAction.playSoundFileNamed(
        "switch.wav", waitForCompletion: true)
    
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        /* Init properties */
        switchNode = self.childNode(withName: "switch") as? SKSpriteNode
        darkNode = self.childNode(withName: "dark") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        switchNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
        
        /* Init Alpha*/
        darkNode?.alpha = 0.0
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_turnoff_light_instructions".localized
        label1.text = "scene_turnoff_light_text1".localized
        label2.text = "scene_turnoff_light_text2".localized
        label3.text = "scene_turnoff_light_text3".localized
        label4.text = "scene_turnoff_light_text4".localized
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                if touchedNode == switchNode  {
                    touchedNode.removeAllActions()
                    
                    /* Create the action */
                    touchedNode.run(switchSound)
                    
                    let alphaAction: SKAction
                    /* Change drak alpha */
                    if darkNode?.alpha == 0 {
                        alphaAction = SKAction.fadeIn(withDuration: 0.2)
                    } else {
                        alphaAction = SKAction.fadeOut(withDuration: 0.2)
                    }
                    darkNode?.run(alphaAction, completion: { 
                        if self.darkNode?.alpha == 0 {
                            self.hideNextButton()
                        } else{
                            self.showNextButton()
                        }
                    })
                }
            }
        }
    }

}
