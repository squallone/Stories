//
//  SADayAndNightScene.swift
//  SiaoApao
//
//  Created by Raúl López on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SADayAndNightScene: SABaseScene {
    
    // MARK: - Constants
    var threshold: CGFloat = 550.0
    
    // MARK: - Points
    var startYPosition: CGFloat = 605.0
    var finishYposition: CGFloat = 360.0
    
    // MARK: - Properties
    var sunSpriteNode: SKSpriteNode?
    var moonSpriteNode: SKSpriteNode?
    var selectedNode = SKSpriteNode()


    /* Setup your scene here */
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        /* Init Properties */
        sunSpriteNode = self.childNodeWithName("sun") as? SKSpriteNode
        moonSpriteNode = self.childNodeWithName("moon") as? SKSpriteNode
        
        /* Set Init Position */
        let sunInitPosition = CGPoint(x: (sunSpriteNode?.position.x)!, y: startYPosition)
        sunSpriteNode?.position = sunInitPosition
        
        let moonInitPosition = CGPoint(x: (moonSpriteNode?.position.x)!, y: finishYposition)
        moonSpriteNode?.position = moonInitPosition
        
        
        /* Add gesture*/
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SADayAndNightScene.handlePanFrom))
        self.view!.addGestureRecognizer(gestureRecognizer)
    }
    
    
    
    // MARK: - Gesture Actions
    
    func handlePanFrom(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .Began {
            print("Began");
            var touchLocation = recognizer.locationInView(recognizer.view)
            touchLocation = self.convertPointToView(touchLocation)
            
            self.selectetNodeForTouch(touchLocation)
        } else if recognizer.state == .Changed {
            var translationPoint = recognizer.translationInView(recognizer.view!)
            translationPoint = CGPoint(x: translationPoint.x, y: -translationPoint.y)
        
            self.panForTranslation(translationPoint)
            recognizer.setTranslation(CGPointZero, inView: recognizer.view)
        } else if recognizer.state == .Ended {
            print("End");
            if selectedNode != sunSpriteNode || selectedNode != moonSpriteNode {
            
            }
        }
    }
    
    func panForTranslation(translation: CGPoint) {
        let selectedNodePosition = selectedNode.position
        print("Change y: \(position)");
        if selectedNode == sunSpriteNode || selectedNode == moonSpriteNode {
            
            var nonSelectedNode = selectedNode == sunSpriteNode ? moonSpriteNode : sunSpriteNode
            let notSelectedNodePosition = selectedNode.position

            
            selectedNode.position = CGPoint(x: selectedNodePosition.x, y: selectedNodePosition.y + translation.y)
            nonSelectedNode?.position = CGPoint()
        }
    }
    
    
    func selectetNodeForTouch(touchLocation: CGPoint) {
        // Get Touched node
        let touchedNode = self.nodeAtPoint(touchLocation)
        
        if touchedNode is SKSpriteNode {
            
            if !selectedNode.isEqual(touchedNode) {
                selectedNode.removeAllActions()
                selectedNode.runAction(SKAction.rotateByAngle(0.0, duration: 0.1))
                
                selectedNode = touchedNode as! SKSpriteNode
                
                if touchedNode == sunSpriteNode || touchedNode == moonSpriteNode {
                    let firstRotationAction = SKAction.rotateByAngle(degToRad(-4.0), duration: 0.1)
                    let secondRotationAction = SKAction.rotateByAngle(0.0, duration: 0.1)
                    let thirdRotationAction = SKAction.rotateByAngle(degToRad(4.0), duration: 0.1)
                    
                    let nodeSequence = SKAction.sequence([firstRotationAction, secondRotationAction, thirdRotationAction])
                    selectedNode.runAction(SKAction.repeatActionForever(nodeSequence))
                }
            }
        }
    }
    
    func degToRad(degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
}
