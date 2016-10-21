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
    var bookGirlsNode: SKSpriteNode?
    var armchairNode: SKSpriteNode?
    var selectedNode = SKNode()
    var numbeOfTotalLetter = 0
    
    // MARK: - PopSound
    let popSound: SKAction = SKAction.playSoundFileNamed(
        "pop.wav", waitForCompletion: true)
    
    var playableRect: CGRect?
    let letterMovePointsPerSec: CGFloat = 280.0
    
    var letterLabelNodeList: [SKLabelNode] = []
    var velocityNodeList: [CGPoint] = []
    var lastUpdateTimeList: [TimeInterval] = []
    var dtList: [TimeInterval] = []
    var words: [String] = ["bubbles".localized,
                           "book".localized,
                           "adventure".localized,
                           "sun".localized,
                           "moon".localized,
                           "turtles".localized,
                           "coach".localized,
                           "dragon".localized,
                           "bed".localized]

    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        self.numbeOfTotalLetter = words.count
        
        /* Init Properties */
        bookNode = self.childNode(withName: "book") as? SKSpriteNode
        bookGirlsNode = self.childNode(withName: "bookGirls") as? SKSpriteNode
        armchairNode = self.childNode(withName: "armchair") as? SKSpriteNode
        
        /* Define the playableRect */
        playableRect = CGRect(x: 0, y: 130,
                              width: size.width,
                              height: size.height - 130)
        
        //debugDrawPlayableArea()
        /* Create the label start with zero */
        createRandomLabel(identifier: 0)

        /* Add gesture*/
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(SABookScene.handlePanFrom))
        self.view!.addGestureRecognizer(gestureRecognizer)
    }
    
    // MARK: - Labels
    
    func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_read_book_instructions".localized
        label1.text = "scene_read_book_text1".localized
        label2.text = "scene_read_book_text2".localized
        label3.text = "scene_read_book_text3".localized
        label4.text = "scene_read_book_text4".localized
    }
    
    /* Override uopdate method */
    override func update(_ currentTime: TimeInterval) {
        
        for (index,letterNode) in letterLabelNodeList.enumerated() {
            if lastUpdateTimeList[index] > 0 {
                dtList[index] = currentTime - lastUpdateTimeList[index]
            } else {
                dtList[index] = 0
            }
            lastUpdateTimeList[index] = currentTime
            
            
            moveSprite(velocity: velocityNodeList[index],
                       letterNode: letterNode,
                       into: index)
            
            boundsCheck(letterNode,
                        into: index)
        }
    }
    
    /* Method To calculate the color in the Y Position of Son */
    func createRandomLabel(identifier: Int) {
        // 1
        let letterLabelNode =  SKLabelNode(fontNamed: "Arial")
        letterLabelNode.name = "letter"
        
        letterLabelNode.text = words[identifier]
        letterLabelNode.fontSize = 50
        letterLabelNode.fontColor = UIColor.black
        letterLabelNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        letterLabelNode.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        letterLabelNode.position = CGPoint(
            x: CGFloat.random(min: (bookGirlsNode?.frame.minX)!,
                              max: (bookGirlsNode?.frame.maxX)!),
            y: (armchairNode?.frame.maxY)!)
    
        letterLabelNode.zPosition = -5
        addChild(letterLabelNode)
        
        /* Add arrays */
        letterLabelNodeList.append(letterLabelNode)
        velocityNodeList.append(CGPoint.zero)
        lastUpdateTimeList.append(0)
        dtList.append(0)
        
        
        /* Appear Action */
        letterLabelNode.setScale(0.1)
        let appearAction = SKAction.scale(to: 1, duration: 1)
        letterLabelNode.run(appearAction) {
            
            let randomPoint = CGPoint(x: CGFloat.random(min: (self.playableRect?.minX)! + 50,
                                                        max: (self.playableRect?.maxX)! - 50),
                                      y: CGFloat.random(min: (self.playableRect?.minY)! + 50,
                                                        max: (self.playableRect?.maxY)! - 50))

            let velocity = self.move(letterLabelNode, to: randomPoint)
            
            /* Update Velocity */
            self.velocityNodeList[identifier] = velocity
            
            /* Add new letter */
            if identifier < self.numbeOfTotalLetter - 1{
                let newIdentifier = identifier + 1
                self.createRandomLabel(identifier: newIdentifier)
            }
            
            /* Action Sprite to change z position */
            let waitAction = SKAction.wait(forDuration: 0.5)
            let zPositionAction = SKAction.run({
                letterLabelNode.zPosition = 1
            })
              let sequence = SKAction.sequence([waitAction, zPositionAction])
            letterLabelNode.run(sequence)
        }
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
            
            if selectedNode is SKLabelNode {
                if selectedNode.frame.intersects((self.bookNode?.frame)!) {
                    selectedNode.run(popSound, completion: {
                        
                        self.selectedNode.removeFromParent()
                        
                        self.numbeOfTotalLetter -= 1
                        
                        if self.numbeOfTotalLetter < 2 {
                            print("Show Next Button")
                            self.showNextButton()
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
            
            if let indexNode = letterLabelNodeList.index(of: touchedNode as! SKLabelNode){
                touchedNode.removeAllActions()

                self.velocityNodeList[indexNode] = CGPoint.zero
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
    
    func debugDrawPlayableArea() {
        let shape = SKShapeNode()
        let path = CGMutablePath()
        
        path.addRect(playableRect!)
        shape.path = path
        shape.strokeColor = SKColor.red
        shape.lineWidth = 5.0
        addChild(shape)
    }
    
    func move(_ letterNode: SKLabelNode, to location: CGPoint) -> CGPoint {
        let offset = CGPoint(x: location.x - letterNode.position.x,
                             y: location.y - letterNode.position.y)
        let length = sqrt(
            Double(offset.x * offset.x + offset.y * offset.y))
        let direction = CGPoint(x: offset.x / CGFloat(length),
                                y: offset.y / CGFloat(length))
        let velocity = CGPoint(x: direction.x * letterMovePointsPerSec,
                               y: direction.y * letterMovePointsPerSec)
        return velocity
    }
    
    
    func boundsCheck(_ letterNode: SKLabelNode, into index: Int) {
        let bottomLeft = CGPoint(x: 0,
                                 y: playableRect!.minY)
        let topRight = CGPoint(x: size.width,
                               y: playableRect!.maxY)
        
            if letterNode.position.x <= bottomLeft.x {
                letterNode.position.x = bottomLeft.x
                velocityNodeList[index].x = -velocityNodeList[index].x
            }
            if letterNode.position.x >= topRight.x {
                letterNode.position.x = topRight.x
                velocityNodeList[index].x = -velocityNodeList[index].x
            }
            if letterNode.position.y <= bottomLeft.y {
                letterNode.position.y = bottomLeft.y
                velocityNodeList[index].y = -velocityNodeList[index].y
            }
            if letterNode.position.y >= topRight.y {
                letterNode.position.y = topRight.y
                velocityNodeList[index].y = -velocityNodeList[index].y
            }
    }
    
    func moveSprite(velocity: CGPoint, letterNode: SKLabelNode, into index: Int) {
            // 1
            let amountToMove = CGPoint(x: velocity.x * CGFloat(dtList[index]),
                                       y: velocity.y * CGFloat(dtList[index]))

        // 2
            letterNode.position = CGPoint(
                x: letterNode.position.x + amountToMove.x,
                y: letterNode.position.y + amountToMove.y)
    }
    
}
