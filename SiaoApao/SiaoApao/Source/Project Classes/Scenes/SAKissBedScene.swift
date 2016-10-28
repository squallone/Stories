//
//  SAKissBedScene.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 08/10/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAKissBedScene: SABaseScene {
    
    // MARK: - Properties
    var girlsNode: SKSpriteNode?
    let kissSound: SKAction = SKAction.playSoundFileNamed(
        "kiss.wav", waitForCompletion: true)
    var isKissGirl: Bool = false
    
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
        girlsNode = self.childNode(withName: "girls") as? SKSpriteNode
        switchNode = self.childNode(withName: "switch") as? SKSpriteNode
        darkNode = self.childNode(withName: "dark") as? SKSpriteNode
        
        /* Init Alpha*/
        darkNode?.alpha = 0.0
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        girlsNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_kiss_apao_instructions".localized
        label1.text = "scene_kiss_apao_text1".localized
        label2.text = "scene_kiss_apao_text2".localized
        label3.text = "scene_kiss_apao_text3".localized
        label4.text = "scene_kiss_apao_text4".localized
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                if touchedNode == girlsNode && isKissGirl == false  {
                    touchedNode.removeAllActions()
                    
                    let newTexture = SKTexture.init(imageNamed: "KissGirl2")
                    let newTextureAction = SKAction.setTexture(newTexture)
                    
                    let groupAction = SKAction.group([newTextureAction, kissSound])

                    /* Create the action */
                    touchedNode.run(groupAction, completion: {
                        
                        // Show the next button
                        /* Title description */
                        self.titleLabel.text = "scene_turnoff_light_instructions".localized
                        self.label1.text = "scene_turnoff_light_text1".localized
                        self.label2.text = "scene_turnoff_light_text2".localized
                        self.label3.text = "scene_turnoff_light_text3".localized
                        self.label4.text = "scene_turnoff_light_text4".localized
                        
                        
                        let bounceAction = SKAction.bounce(to: 1.01, duration: 0.2)
                        self.switchNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
                        //self.showNextButton()
                        self.isKissGirl = true
                    })
                } else if touchedNode == switchNode {
                    touchedNode.removeAllActions()
                    
                    /* Create the action */
                    touchedNode.run(switchSound)
                    
                    let alphaAction: SKAction
                    /* Change drak alpha */
                    if darkNode?.alpha == 0 {
                        alphaAction = SKAction.fadeIn(withDuration: 0.5)
                    } else {
                        alphaAction = SKAction.fadeOut(withDuration: 0.5)
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
