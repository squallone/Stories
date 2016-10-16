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

    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init properties */
        girlsNode = self.childNode(withName: "girls") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        girlsNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                if touchedNode == girlsNode  {
                    touchedNode.removeAllActions()
                    
                    let newTexture = SKTexture.init(imageNamed: "KissGirl2")
                    let newTextureAction = SKAction.setTexture(newTexture)
                    
                    let groupAction = SKAction.group([newTextureAction, kissSound])

                    /* Create the action */
                    touchedNode.run(groupAction, completion: {
                        print("show the next button")
                    })
                }
            }
        }
    }
}
