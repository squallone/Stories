//
//  ToothbrushScene.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 9/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class ToothbrushScene: SABaseScene {
    
    // MARK: - Properties
    var bubblesGirlNode: SKSpriteNode?
    var bubblesGirlTwoNode: SKSpriteNode?
    
    // MARK: - Action
    var bubblesGirlNumberTouch: NSInteger = 8
    var bubblesGirlTwoNumberTouch: NSInteger = 8
    
    var constantAlpha: CGFloat = (1 / 8)

    
    let brushSound: SKAction = SKAction.playSoundFileNamed(
        "brush.wav", waitForCompletion: true)
    
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        /* Init properties */
        bubblesGirlNode = self.childNode(withName: "bubbles1") as? SKSpriteNode
        bubblesGirlTwoNode = self.childNode(withName: "bubbles2") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.05, duration: 0.2)
        bubblesGirlNode?.run(SKAction.repeatForever(bounceAction))
        bubblesGirlTwoNode?.run(SKAction.repeatForever(bounceAction))
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        super.updateLocalizableString()

        /* Title description */
        titleLabel.text = "scene_brush_teeth_instructions".localized
        label1.text = "scene_brush_teeth_text1".localized
        label2.text = "scene_brush_teeth_text2".localized
        label3.text = "scene_brush_teeth_text3".localized
        label4.text = "scene_brush_teeth_text4".localized
        adviceString = "scene_brush_teeth_advice".localized

    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                if touchedNode == bubblesGirlNode || touchedNode == bubblesGirlTwoNode {
                    let animationTouches = touchedNode == bubblesGirlNode ? bubblesGirlNumberTouch : bubblesGirlTwoNumberTouch

                    if (touchedNode.hasActions()) {
                        touchedNode.removeAllActions()
                    
                        /* Calculate the new Alpha */
                        let newAlpha = touchedNode.alpha - constantAlpha

                        /* Create the action */
                        let bubbleAnimation = SKAction.fadeAlpha(to: newAlpha,
                                                                 duration: 0.8)
                        let groupAction = SKAction.group([bubbleAnimation,brushSound])
                        
                        touchedNode.run(groupAction, completion: {
                            if (animationTouches > 1) {
                                let bounceAction = SKAction.bounce(to: 1.05, duration: 0.2)
                                touchedNode.run(SKAction.repeatForever(bounceAction))
                                
                                /* Update Photo Touches */
                                if touchedNode == self.bubblesGirlNode {
                                    self.bubblesGirlNumberTouch -= 1
                                } else {
                                    self.bubblesGirlTwoNumberTouch -= 1
                                }
                                
                                if self.checkBubbleIsTapped() {
                                    
                                    // Show next button
                                    self.showNextButton()
                                }
                            }
                        })
                    }
                }
            }
        }
    }
    
    
    /* Check if both portrats is in finish  */
    func checkBubbleIsTapped() -> Bool {
        
        var firsPortraitIsTapped: Bool = false
        var secondPortraitIsTapped: Bool = false
        
        if (bubblesGirlNode?.alpha)! <= 0.0 {
            firsPortraitIsTapped = true
        }
        
        if (bubblesGirlTwoNode?.alpha)! <= 0.0 {
            secondPortraitIsTapped = true
        }
        
        let allBubbleIsTapped = (firsPortraitIsTapped && secondPortraitIsTapped)
        return allBubbleIsTapped
    }

}
