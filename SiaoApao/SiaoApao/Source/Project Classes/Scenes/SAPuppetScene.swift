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
    private var numberTick: CGFloat = 10
    
    let laughSound: SKAction = SKAction.playSoundFileNamed(
        "laughing.wav", waitForCompletion: true)
    var selectedNode = SKSpriteNode()

    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init Properties */
        puppetSpriteNode = self.childNode(withName: "puppet") as? SKSpriteNode
        
        /* Create the smile */
        self.createSmile(with: 1)
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        puppetSpriteNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
        
        /* Add gesture*/
        let upGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SAPuppetScene.handleSwipe(from:)))
        self.view!.addGestureRecognizer(upGestureRecognizer)
    }
    
    // MARK: Public methods
    // NOTE: Value -1 to 1
    func createSmile(with value:CGFloat) {
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
            if (numberTick > 0 && selectedNode == puppetSpriteNode) {
                
                puppetSpriteNode?.run(laughSound, withKey: "laungAction")

                /* Calculate the unit value */
                let unitValue = 1.0 - (2.0 / numberTick)
                createSmile(with: unitValue)
                
                /* Update number of tick */
                numberTick = numberTick - 1
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
