//
//  SASceneGlobes.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/8/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SASceneGlobes: SABaseScene {
    
    // MARK: - PopSound
    let popSound: SKAction = SKAction.playSoundFileNamed(
        "pop.wav", waitForCompletion: true)
    var totalBubbles: Int = 0
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
     
        self.updateLocalizableString()
  
        /* Add bubble animation */
        enumerateChildNodes(withName: "bubble") { (node, stop) in
            
            /* Random duration */
            let firstDuration = CGFloat.random(min: 0.1, max: 1)
            let secondDuration = CGFloat.random(min: 0.1, max: 1)
            let thirdDuration = CGFloat.random(min: 0.1, max: 1)
            
            /* Random Move Action */
            let firstVector = CGVector(dx: CGFloat.random(min: 0, max: 10) ,
                                       dy: CGFloat.random(min: 0, max: 10))
            let moveAction = SKAction.move(by: firstVector, duration: TimeInterval(firstDuration))
            
            let secondVector = CGVector(dx: CGFloat.random(min: 0, max: 10) ,
                                       dy: CGFloat.random(min: 0, max: 10))
            let secondAction  = SKAction.move(by: secondVector, duration: TimeInterval(secondDuration))
            
            let secondActionReversed = secondAction.reversed()
            
            
            let thirdVector = CGVector(dx: CGFloat.random(min: 0, max: 10) ,
                                        dy: CGFloat.random(min: 0, max: 10))
            let thirdAction  = SKAction.move(by: thirdVector, duration: TimeInterval(thirdDuration))

            let thirdActionReversed = thirdAction.reversed()
            let firstActionReversed = moveAction.reversed()
            
            let sequence = SKAction.sequence([moveAction,
                                              secondAction,
                                              secondActionReversed,
                                              thirdAction,
                                              thirdActionReversed,
                                              firstActionReversed])
            let actionForever = SKAction.repeatForever(sequence)
            node.run(actionForever)
            
            self.totalBubbles += 1;
            
        }
        
        
    }
    
    
    // MARK: - Labels
    
    func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_bubbles_instructions".localized
        label1.text = "scene_bubbles_text1".localized
        label2.text = "scene_bubbles_text2".localized
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                if touchedNode.name == "bubble"{
                    touchedNode.run(popSound, completion: {
                        
                        touchedNode.removeFromParent()
                        
                        self.totalBubbles -= 1
                        if self.totalBubbles <= 0 {
                            print("Show Next Button")
                        }

                    })
                
                }
            }
        }
    }
}
