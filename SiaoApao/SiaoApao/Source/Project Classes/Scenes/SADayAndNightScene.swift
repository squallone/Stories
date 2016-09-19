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
    
    // MARK: - Colors
    
    // MARK: - Properties
    var sunSpriteNode: SKSpriteNode?
    var moonSpriteNode: SKSpriteNode?
    var skyBackgroundNode: SKSpriteNode?
    var selectedNode = SKSpriteNode()
    
    // MARK: - Colors
    enum SATypeColor {
        case topTypeColor
        case downTypeColor
    }


    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init Properties */
        sunSpriteNode = self.childNode(withName: "sun") as? SKSpriteNode
        moonSpriteNode = self.childNode(withName: "moon") as? SKSpriteNode
        skyBackgroundNode = self.childNode(withName: "SkyBackground") as? SKSpriteNode
        
        /* Set Init Position */
        let sunInitPosition = CGPoint(x: (sunSpriteNode?.position.x)!, y: startYPosition)
        sunSpriteNode?.position = sunInitPosition
        
        let moonInitPosition = CGPoint(x: (moonSpriteNode?.position.x)!, y: finishYposition)
        moonSpriteNode?.position = moonInitPosition
        
        /* Add gesture*/
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SADayAndNightScene.handlePanFrom))
        self.view!.addGestureRecognizer(gestureRecognizer)
        
        /* Init BackGround node */
        selectedNode = sunSpriteNode as SKSpriteNode!
        self.updateBackgraoundNodeColor()
        
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
            if selectedNode == sunSpriteNode || selectedNode == moonSpriteNode {
                /* Remove bounce action */
                //selectedNode.removeAllActions()
                
                /* Get Not selectedNode*/
                let notSelectedNode = selectedNode == sunSpriteNode ? moonSpriteNode : sunSpriteNode

                let yNodePosition = selectedNode.position.y
                var selectedNodeYPosition: CGFloat
                var nonSelectNodeYPosition: CGFloat
                print("End y: \(selectedNode.position)");

                if yNodePosition < threshold {
                    selectedNodeYPosition = finishYposition
                    nonSelectNodeYPosition = startYPosition
                } else {
                    selectedNodeYPosition = startYPosition
                    nonSelectNodeYPosition = finishYposition
                }
                
                let selectedNodeMoveAction = SKAction.moveTo(y: selectedNodeYPosition, duration: 0.1)
                selectedNode.run(selectedNodeMoveAction, completion: {
                    self.updateBackgraoundNodeColor()
                })
                
                let nonSelectedNodeMoveAction = SKAction.moveTo(y: nonSelectNodeYPosition, duration: 0.1)
                notSelectedNode?.run(nonSelectedNodeMoveAction)
            }
        }
    }
    
    func panForTranslation(_ translation: CGPoint) {
        if selectedNode == sunSpriteNode || selectedNode == moonSpriteNode {
            let selectedNodePosition = selectedNode.position
            print("Change y: \(selectedNodePosition)");
            
            let notSelectedNode = selectedNode == sunSpriteNode ? moonSpriteNode : sunSpriteNode
            let notSelectedNodePosition = notSelectedNode?.position
            
            selectedNode.position = CGPoint(x: selectedNodePosition.x, y: selectedNodePosition.y + translation.y)
            notSelectedNode?.position = CGPoint(x:(notSelectedNodePosition?.x)!, y: (notSelectedNodePosition?.y)! - translation.y)
            
            self.updateBackgraoundNodeColor()
        }
    }
    
    func selectetNodeForTouch(_ touchLocation: CGPoint) {
        // Get Touched node
        let touchedNode = self.atPoint(touchLocation)
        
        if touchedNode is SKSpriteNode {
            /* Assign the nuew selected node */
            selectedNode = touchedNode as! SKSpriteNode
                
            if touchedNode == sunSpriteNode || touchedNode == moonSpriteNode {
                
                if (!selectedNode.hasActions()) {
                    /* Create Bounce Action */
                    let bounceDuration = 0.2
                    let scaleAction = SKAction.scale(by: 1.1, duration: bounceDuration)
                    let reversedAcion = scaleAction.reversed()
                    
                    /* Create Squence action and repeat it forever */
                    let nodeSequence = SKAction.sequence([scaleAction, reversedAcion])
                    selectedNode.run(SKAction.repeatForever(nodeSequence))
                }
            }
        }
    }
    
    /* Method to transform degrees in Radians */
    func degToRad(_ degree: Double) -> CGFloat {
        return CGFloat(degree / 180.0 * M_PI)
    }
    
    /* Method To calculate the color in the Y Position of Son */
    func backgroundColor(y: CGFloat, typeColor: SATypeColor) -> SKColor {
        var redComponent: CGFloat
        var greenComponent: CGFloat
        var blueComponent: CGFloat
        
        let transitionDistance = startYPosition - finishYposition //245
    
        if typeColor == SATypeColor.topTypeColor {
            redComponent = (y - 360) * (49.0 / transitionDistance) + 42.0
            greenComponent = (y - 360) * (106.0 / transitionDistance) + 31.0
            blueComponent = (y - 360) * (129.0 / transitionDistance) + 74.0
        } else {
            redComponent = (y - 360) * (155.0 / transitionDistance) + 46.0
            greenComponent = (y - 360) * (151.0 / transitionDistance) + 36.0
            blueComponent = (y - 360) * (140.0 / transitionDistance) + 99.0
        }
        
        let finalColor = UIColor(red: redComponent/255.0, green: greenComponent/255.0, blue: blueComponent/255.0, alpha: 1.0)
        return finalColor

    }
    
    func updateBackgraoundNodeColor() {
        let selectedNodePosition = sunSpriteNode?.position

        let colorTop = self.backgroundColor(y: (selectedNodePosition?.y)!, typeColor: SATypeColor.topTypeColor)
        let colorBottom = self.backgroundColor(y: (selectedNodePosition?.y)!, typeColor: SATypeColor.downTypeColor)
        let sizeTexture = skyBackgroundNode?.size
        let texture =  SKTexture.init(size: sizeTexture!, firstColor: colorTop, lastColor: colorBottom)
        skyBackgroundNode?.texture = texture
    }
}
