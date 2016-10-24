//
//  SALivingRoom.swift
//  SiaoApao
//
//  Created by Raul Lopez Martinez on 09/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SALivingRoomScene: SABaseScene {
    
    // MARK: - Properties
    var milkNode: SKSpriteNode?
    let maxNumberTexture: Int = 6
    var countTexture: Int = 0
    
    let liquidSound: SKAction = SKAction.playSoundFileNamed(
        "liquid.wav", waitForCompletion: true)
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        /* Init properties */
        milkNode = self.childNode(withName: "milk") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.01, duration: 0.2)
        milkNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_milk_instructions".localized
        label1.text = "scene_milk_text1".localized
        label2.text = "scene_milk_text2".localized
        label3.text = "scene_milk_text3".localized
        label4.text = "scene_milk_text4".localized
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                if touchedNode == milkNode  {
                    /* Remove action */
                    touchedNode.removeAction(forKey: "moving")

                    if !touchedNode.hasActions() {
                        countTexture = countTexture + 1
                        if countTexture <= maxNumberTexture {
                            
                            /* Create new texture */
                            let photoImageName = "milk\(countTexture)"
                            let newTexture = SKTexture.init(imageNamed: photoImageName)
                            
                            /* Set new texture */
                            let milkTextureAction = SKAction.setTexture(newTexture, resize: true)

                            let groupAction = SKAction.group([milkTextureAction,liquidSound])
                            touchedNode.run(groupAction, completion: { 
                                touchedNode.removeAllActions()
                            })

                            hideNextButton()

                        } else {
                            showNextButton()

                        }
                    }
                }
            }
        }
    }
}
