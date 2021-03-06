//
//  SAFishbowlScene.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 09/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAFishbowlScene: SABaseScene {
    
    // MARK: - Properties
    var fishNode: SKSpriteNode?
    var caveNode: SKSpriteNode?
    var dialogNode: SKSpriteNode?
    var dialogLabelNode: SKLabelNode?
    var bidirectionalArrow: SKSpriteNode?
    var selectedNode = SKSpriteNode()
    
    // MARK: - Final Position
    var finalPositon: CGPoint = CGPoint(x: 860, y: 410)
    var caveAction: SKAction?

    // MARK: - Sound Action
    let goodNightSound: SKAction = SKAction.playSoundFileNamed(
        "goodnight.wav", waitForCompletion: true)
    
    var isFirstTime = true
    var isFinish = false
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init properties */
        fishNode = self.childNode(withName: "fish") as? SKSpriteNode
        caveNode = self.childNode(withName: "cave") as? SKSpriteNode
        bidirectionalArrow = self.childNode(withName: "arrow") as? SKSpriteNode
        dialogNode = self.childNode(withName: "dialog") as? SKSpriteNode
        dialogLabelNode = dialogNode?.childNode(withName: "dialogLabel") as? SKLabelNode
        
        /* Localizeable String  */
        self.updateLocalizableString()

        
        /* Add gesture */
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SAFishbowlScene.handlePanFrom))
        self.view!.addGestureRecognizer(gestureRecognizer)

        /* Bounce action */
        let bounceAction = SKAction.bounce(to: 1.05, duration: 0.2)
        bidirectionalArrow?.run(SKAction.repeatForever(bounceAction))
        
        caveAction = SKAction.move(by: CGVector(dx:1.0, dy:0.0), duration: 1.0)
        
        /* Hide dialogNode */
        dialogNode?.alpha = 0
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        super.updateLocalizableString()

        /* Title description */
        titleLabel.text = "scene_goodnight_galileo_instructions".localized
        label1.text = "scene_goodnight_galileo_text1".localized
        label2.text = "scene_goodnight_galileo_text2".localized
        label3.text = "scene_goodnight_galileo_text3".localized
        label4.text = "scene_goodnight_galileo_text4".localized
        adviceString = "scene_goodnight_galileo_advice".localized

        
        // TODO: Localized Text
        dialogLabelNode?.text = "Good Night"
    }
    
    func handlePanFrom(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            /* Get Touch Location */
            /* Get Touch Location */
            var touchLocation = recognizer.location(in: recognizer.view)
            touchLocation = self.convertPoint(toView: touchLocation)
            
            self.selectetNodeForTouch(touchLocation)
            
        } else if recognizer.state == .changed {
            
            var translationPoint = recognizer.translation(in: recognizer.view!)
            print("translationPoint \(translationPoint)")
            translationPoint = CGPoint(x: translationPoint.x, y: -translationPoint.y)
            
            self.panForTranslation(translationPoint)
            recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
        }
    }
    
    func selectetNodeForTouch(_ touchLocation: CGPoint) {
        // Get Touched node
        let touchedNode = self.atPoint(touchLocation)
        
        if touchedNode is SKSpriteNode {
            /* Assign the nuew selected node */
            selectedNode = touchedNode as! SKSpriteNode
        }
    }
    
    func panForTranslation(_ translation: CGPoint) {
        if selectedNode == bidirectionalArrow {
            let selectedNodePosition = selectedNode.position
            print("selectedNodePosition \(selectedNodePosition)")
            let newPositionX = selectedNodePosition.x + translation.x
            print("newPosition \(newPositionX)")

            if translation.x > 5.0 {
                
                if isFirstTime {
                    flipTile(node: fishNode!)
                    isFirstTime = false
                } else {
                    
                    fishNode?.run(caveAction!, completion: {
                        if (self.fishNode?.position.x)! > self.finalPositon.x && !self.isFinish {

                            self.isFinish = true

                            let crossFaceAction = SKAction.fadeOut(withDuration: 1.0)
                            self.fishNode?.run(crossFaceAction, completion: {
                                
                                /* Good night Action */
                                let fadeInAction = SKAction.fadeIn(withDuration: 1.0)
                                let groupActon = SKAction.group([self.goodNightSound, fadeInAction])
                                self.dialogNode?.run(groupActon, completion: {
                                    // Show next button
                                    self.showNextButton()
                                })
                            })
                        }
                    })
                }
            }
        }
    }
    
    
    func flipTile(node : SKSpriteNode) {
        
        let flip = SKAction.scaleX(to: -1, duration: 0.4)
        
        node.setScale(1.0)
        
        let newTexture = SKTexture.init(imageNamed: "fish")
        let newTextureAction = SKAction.setTexture(newTexture)
        
        let action = SKAction.sequence([flip, newTextureAction])
        
        node.run(action)
        
    }
    
}
