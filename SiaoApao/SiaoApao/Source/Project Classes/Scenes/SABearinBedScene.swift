//
//  SABearinBedScene.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 9/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SABearinBedScene: SABaseScene {
    
    // MARK: - Properties
    var dialogNode: SKSpriteNode?
    var dialogLabelNode: SKLabelNode?
    var bearNode: SKSpriteNode?
    let popSound: SKAction = SKAction.playSoundFileNamed(
        "pop.wav", waitForCompletion: true)
    
    var currentSelect: Int = 0
    
    let phrasesLetter: [String] = ["orli_dialogue1".localized,
                                   "orli_dialogue2".localized,
                                   "orli_dialogue3".localized,
                                   "orli_dialogue4".localized]
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        /* Init properties */
        bearNode = self.childNode(withName: "bear") as? SKSpriteNode
        dialogNode = self.childNode(withName: "dialog") as? SKSpriteNode
        dialogLabelNode = dialogNode?.childNode(withName: "dialogLabel") as? SKLabelNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        bearNode?.run(SKAction.repeatForever(bounceAction))
        
        /* Update Text */
        self.updatephrases(from: self.currentSelect)
        
        /* Hide dialogNode */
        dialogNode?.alpha = 0
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_cuddle_orli_instructions".localized
        label1.text = "scene_cuddle_orli_text1".localized
        label2.text = "scene_cuddle_orli_text2".localized
        label3.text = "scene_cuddle_orli_text3".localized
        label4.text = "scene_cuddle_orli_text4".localized
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                if touchedNode == bearNode  {
                    
                    if (touchedNode.hasActions()) {
                        touchedNode.removeAllActions()
                        
                        if dialogNode?.alpha == 0 {
                            
                            /* Create the action */
                            let alphaAnimation = SKAction.fadeAlpha(to: 1.0,
                                                                     duration: 0.8)
                            let groupAction = SKAction.group([alphaAnimation, popSound])
                            dialogNode?.run(groupAction, completion: {
                                self.currentSelect += 1
                                
                                /* Create Bounce Action */
                                let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
                                self.bearNode?.run(SKAction.repeatForever(bounceAction))

                            })
                        } else if currentSelect < phrasesLetter.count {
                            touchedNode.run(popSound, completion: { 
                                self.updatephrases(from: self.currentSelect)
                                self.currentSelect += 1
                                
                                /* Create Bounce Action */
                                let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
                                self.bearNode?.run(SKAction.repeatForever(bounceAction))
                            })
                        } else {
                            // Show next button
                            showNextButton()
                        }
                    }
                }
            }
        }
    }
    
    
    func updatephrases(from identifier: Int) {
        let newPhrases = phrasesLetter[identifier]
        dialogLabelNode?.text = newPhrases
    }
    
}
