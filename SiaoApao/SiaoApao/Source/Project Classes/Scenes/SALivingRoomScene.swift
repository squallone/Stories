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
        
        /* Init properties */
        milkNode = self.childNode(withName: "milk") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.01, duration: 0.2)
        milkNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
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

                            print("No Show next Button")

                        } else {
                            print("Show next Button")

                        }
                    }
                }
            }
        }
    }
}
