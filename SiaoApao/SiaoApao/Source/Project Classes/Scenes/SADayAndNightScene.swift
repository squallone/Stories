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
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init Properties */
        sunSpriteNode = self.childNode(withName: "sun") as? SKSpriteNode
        moonSpriteNode = self.childNode(withName: "moon") as? SKSpriteNode
        
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
    
    func handlePanFrom(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            print("Began");
            var touchLocation = recognizer.location(in: recognizer.view)
            touchLocation = self.convertPoint(toView: touchLocation)
            
            self.selectetNodeForTouch(touchLocation)
        } else if recognizer.state == .changed {
            var translationPoint = recognizer.translation(in: recognizer.view!)
            translationPoint = CGPoint(x: translationPoint.x, y: -translationPoint.y)
        
            self.panForTranslation(translationPoint)
            recognizer.setTranslation(CGPoint.zero, in: recognizer.view)
        } else if recognizer.state == .ended {
            print("End");
            if selectedNode != sunSpriteNode || selectedNode != moonSpriteNode {
            
            }
        }
    }
    
    func panForTranslation(_ translation: CGPoint) {
        let selectedNodePosition = selectedNode.position
        print("Change y: \(position)");
        if selectedNode == sunSpriteNode || selectedNode == moonSpriteNode {
            
            let nonSelectedNode = selectedNode == sunSpriteNode ? moonSpriteNode : sunSpriteNode
            let notSelectedNodePosition = selectedNode.position
            
            selectedNode.position = CGPoint(x: selectedNodePosition.x, y: selectedNodePosition.y + translation.y)
            nonSelectedNode?.position = CGPoint(x:notSelectedNodePosition.x, y: notSelectedNodePosition.y + translation.y)
        }
    }
    
    
    func selectetNodeForTouch(_ touchLocation: CGPoint) {
        // Get Touched node
        let touchedNode = self.atPoint(touchLocation)
        
        if touchedNode is SKSpriteNode {
            
            if !selectedNode.isEqual(touchedNode) {
                selectedNode.removeAllActions()
                selectedNode.run(SKAction.rotate(byAngle: 0.0, duration: 0.1))
                
                selectedNode = touchedNode as! SKSpriteNode
                
                if touchedNode == sunSpriteNode || touchedNode == moonSpriteNode {
                    let firstRotationAction = SKAction.rotate(byAngle: degToRad(-4.0), duration: 0.1)
                    let secondRotationAction = SKAction.rotate(byAngle: 0.0, duration: 0.1)
                    let thirdRotationAction = SKAction.rotate(byAngle: degToRad(4.0), duration: 0.1)
                    
                    let nodeSequence = SKAction.sequence([firstRotationAction, secondRotationAction, thirdRotationAction])
                    selectedNode.run(SKAction.repeatForever(nodeSequence))
                }
            }
        }
    }
    
    func degToRad(_ degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
}
