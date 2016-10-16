//
//  SAPuppetScene.swift
//  SiaoApao
//
//  Created by Raul Lopez Martinez on 09/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAPuppetScene: SABaseScene {
    
    // MARK: - Properties
    private var puppetSpriteNode: SKSpriteNode?
    private var smileShapeNode: SKShapeNode!
    private var tralingAreaNode: SKSpriteNode?
    private var leadingAreaNode: SKSpriteNode?
    private var tralingArrowNode: SKSpriteNode?
    private var leadingArrowNode: SKSpriteNode?
    
    private var numberTick: CGFloat = 10
    private var currentSmileValue: CGFloat = 1

    
    let laughSound: SKAction = SKAction.playSoundFileNamed(
        "laughing.wav", waitForCompletion: true)
    var selectedNode = SKSpriteNode()

    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
       
        self.updateLocalizableString()
        
        /* Init Properties */
        puppetSpriteNode = self.childNode(withName: "puppet") as? SKSpriteNode
        tralingAreaNode = self.childNode(withName: "tralingArea") as? SKSpriteNode
        leadingAreaNode = self.childNode(withName: "leadingArea") as? SKSpriteNode
        tralingArrowNode = self.childNode(withName: "lateralRightArrow") as? SKSpriteNode
        leadingArrowNode = self.childNode(withName: "lateralLeftArrow") as? SKSpriteNode
        
        /* Create the smile */
        self.createSmile(with: currentSmileValue)
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.05, duration: 0.2)
        tralingArrowNode?.run(SKAction.repeatForever(bounceAction))
        leadingArrowNode?.run(SKAction.repeatForever(bounceAction))
        
        /* Add gesture*/
        let upGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SAPuppetScene.handleSwipe(from:)))
        self.view!.addGestureRecognizer(upGestureRecognizer)
    }
    
    // MARK: - Labels
    
    func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_dress_instructions".localized
        label1.text = "scene_tickle_text1".localized
        label2.text = "scene_tickle_text2".localized
        label3.text = "scene_tickle_text3".localized
        label4.text = "scene_tickle_text4".localized
    }
    
    // MARK: Public methods
    // NOTE: Value -1 to 1
    func createSmile(with value: CGFloat) {
        /* remove smile */
        smileShapeNode?.removeFromParent()
        
        /* Create path */
        let auxFloat = value * 30.0
        let controlYValue = auxFloat - 110
        
        /* Create the smile */
        let smileCenter = CGPoint(x: -50, y: -110)
        
        let arcPath =  UIBezierPath()
        arcPath.move(to: smileCenter)
        arcPath.addQuadCurve(to: CGPoint(x: 10, y: -110),
                             controlPoint: CGPoint(x: -20, y: controlYValue))
        
        arcPath.addLine(to: CGPoint(x: 10, y: -110))
        
        smileShapeNode = SKShapeNode(path: arcPath.cgPath)
        smileShapeNode.strokeColor = UIColor.red
        smileShapeNode.lineWidth = 5
        smileShapeNode.zPosition = (puppetSpriteNode?.zPosition)! + 1
        puppetSpriteNode?.addChild(smileShapeNode!)
    }
    
    // MARK: - Gesture Actions
    func handleSwipe(from recognizer: UISwipeGestureRecognizer) {
        if recognizer.state == .began {
            /* Get Touch Location */
            var touchLocation = recognizer.location(in: recognizer.view)
            touchLocation = self.convertPoint(toView: touchLocation)
            
            self.selectetNodeForTouch(touchLocation)
            
        } else if recognizer.state == .changed {
            
            
        } else if recognizer.state == .ended {
           
            if (selectedNode == tralingAreaNode || selectedNode == leadingAreaNode) {
                
                /* The minimum value*/
                if currentSmileValue > -1 {
                    puppetSpriteNode?.run(laughSound, withKey: "laungAction")
                    
                    /* Calculate the unit value */
                    let changeRate = (2.0 / numberTick)
                    currentSmileValue = currentSmileValue - changeRate
                    print("currentSmileValue \(currentSmileValue)")

                    createSmile(with: currentSmileValue)
                    
                    print("Not show Next Button")
                } else {
                    /* HideArrows */
                    let fadeOutAction = SKAction.fadeOut(withDuration: 1.0)
                    tralingArrowNode?.run(fadeOutAction)
                    leadingArrowNode?.run(fadeOutAction)
                    print("show Next Button")
                }
            }
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
}
