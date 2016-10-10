//
//  SABookScene.swift
//  SiaoApao
//
//  Created by Raul Lopez Martinez on 09/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SABookScene: SABaseScene {
    
    // MARK: - Properties
    var bookNode: SKSpriteNode?
    var selectedNode = SKNode()
    var previousLabelNode: SKLabelNode?
    var numbeOfTotalLetter = 12
    
    let popSound: SKAction = SKAction.playSoundFileNamed(
        "pop.wav", waitForCompletion: true)
    
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init Properties */
        bookNode = self.childNode(withName: "book") as? SKSpriteNode
        
        var indexValue = 0
        for _ in 1...numbeOfTotalLetter {
            /* Create the total letter*/
            createRandomLabel(identifier: indexValue)
            indexValue += 1;
        }
        
        /* Add gesture*/
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SADayAndNightScene.handlePanFrom))
        self.view!.addGestureRecognizer(gestureRecognizer)

    }
    
//    override func didEvaluateActions() {
//        checkCollisions()
//    }
    
    
    /* Method To calculate the color in the Y Position of Son */
    func createRandomLabel(identifier: Int) {
        // 1
        let letterLabelNode =  SKLabelNode(fontNamed: "Arial")
        letterLabelNode.name = "letter"
        
        letterLabelNode.text = randomStringWithLength(len: 0)
        letterLabelNode.fontSize = 80
        letterLabelNode.fontColor = UIColor.black
        letterLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        letterLabelNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        letterLabelNode.position = CGPoint(
            x: CGFloat.random(min: (self.view?.frame)!.minX + 50,
                              max: (self.view?.frame)!.maxX - 50),
            y: CGFloat.random(min: (self.view?.frame)!.minY + 50,
                              max: (self.view?.frame)!.maxY - 50))
        letterLabelNode.zPosition = 50
        addChild(letterLabelNode)

        /* Add Bounce action */
        let bounceAction = SKAction.bounce(to: 1.1, duration: 0.2)
        letterLabelNode.run(SKAction.repeatForever(bounceAction))
    }
    
    /* Create the random Strig */
    func randomStringWithLength (len : Int) -> String {

        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for _ in 0...len {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return randomString as String
    }
    
    // MARK: - Gesture Actions
    func handlePanFrom(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            /* Get Touch Location */
            var touchLocation = recognizer.location(in: recognizer.view)
            touchLocation = self.convertPoint(fromView: touchLocation)
            
            /* Update the node select */
            selectetNodeForTouch(touchLocation)

        } else if recognizer.state == .changed {
            /* Calculate the Translation Point */
            var translationPoint = recognizer.translation(in: recognizer.view!)
            translationPoint = CGPoint(x: translationPoint.x, y: -translationPoint.y)

            /* Update the selected Node Position */
            panForTranslation(translationPoint)
            recognizer.setTranslation(CGPoint.zero, in: recognizer.view)

        } else if recognizer.state == .ended {
            if previousLabelNode != nil {
                /* Add Bounce action */
                let bounceAction = SKAction.bounce(to: 1.1, duration: 0.2)
                previousLabelNode?.run(SKAction.repeatForever(bounceAction))
            }
            
            if selectedNode is SKLabelNode {
                if selectedNode.frame.intersects((self.bookNode?.frame)!) {
                    selectedNode.run(popSound, completion: {
                        self.selectedNode.removeFromParent()
                        
                        self.numbeOfTotalLetter -= 1
                        if self.numbeOfTotalLetter == 0 {
                            print("Show Next Button")
                        }
                    })
                }
            }
            
        }
    }
    
    // MARK: - Private Method
    func selectetNodeForTouch(_ touchLocation: CGPoint) {
        // Get Touched node
        let touchedNode = self.atPoint(touchLocation)
        
        /* Assign the nuew selected node */
        selectedNode = touchedNode
        
        if touchedNode is SKLabelNode {
            if !selectedNode.isEqual(touchedNode) {
                touchedNode.removeAllActions()
                previousLabelNode = touchedNode as? SKLabelNode

                print("ayuda \(touchedNode.name)")
                
            }
        }
    }
    
    
    func panForTranslation(_ translation: CGPoint) {
        if selectedNode is SKLabelNode {
            let selectedNodePosition = selectedNode.position
            selectedNode.position = CGPoint(x: selectedNodePosition.x + translation.x,
                                            y: selectedNodePosition.y + translation.y)
            
        }
    }
    
    // MARK: - Local Method
//    func checkCollisions() {
//        //var hitLetter: [SKLabelNode] = []
//        enumerateChildNodes(withName: "letter") { (node, _ ) in
//            let letter = node as! SKLabelNode
//            if letter.frame.intersects((self.bookNode?.frame)!) {
//                print("Colisoon")
//
//            }
//        }
//    }
    
}
