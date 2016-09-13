//
//  SADayAndNightScene.swift
//  SiaoApao
//
//  Created by Raúl López on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SADayAndNightScene: SABaseScene {
    
    // MARK: - Points
    var startYPosition: CGFloat?
    var finishYposition: CGFloat?
    
    // MARK: - Properties
    var sunSpriteNode: SKSpriteNode?
    var moonSpriteNode: SKSpriteNode?
    var selectedNode = SKSpriteNode()


    /* Setup your scene here */
    override func didMoveToView(view: SKView) {
        super.didMoveToView(view)
        
        sunSpriteNode = self.childNodeWithName("sun") as? SKSpriteNode
        moonSpriteNode = self.childNodeWithName("moon") as? SKSpriteNode
        
        let gestureRecognizer = UIGestureRecognizer(target: self, action: #selector(SADayAndNightScene.handlePanFrom))
        self.view!.addGestureRecognizer(gestureRecognizer)
    }
    
    
    // MARK: - Gesture Actions
    
    func handlePanFrom(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .Began {
            var touchLocation = recognizer.locationInView(recognizer.view)
            touchLocation = self.convertPointToView(touchLocation)
        } else if recognizer.state == .Changed {
            
        } else if recognizer.state == .Ended {
            
            
        }
    }
    
    func panForTranslation(translation: CGPoint) {
        let position = selectedNode.position
        
        if selectedNode.name! == sunSpriteNode || selectedNode.name! == moonSpriteNode {
            selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
        }
    }
}
