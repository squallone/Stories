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

                    if (touchedNode.hasActions()) {
                        touchedNode.removeAllActions()
                        
                        let animationDuration = 1.0
                        let animationAction = SKAction.customAction(withDuration: animationDuration, actionBlock: { (node, duration) in
                            node.alpha = 1 - duration / CGFloat(animationDuration)
                        })
                        
                        let groupAction = SKAction.group([animationAction, liquidSound])
                        touchedNode.run(groupAction)
                        print("Show next Button")
                    } else {
                        print("Hide next Button")

                    }
                }
            }
        }
    }
}
