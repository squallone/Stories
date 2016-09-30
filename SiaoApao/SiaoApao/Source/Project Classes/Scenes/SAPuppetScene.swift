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
    
    let laughSound: SKAction = SKAction.playSoundFileNamed(
        "laughing.aiff", waitForCompletion: true)
    
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init Properties */
        puppetSpriteNode = self.childNode(withName: "puppet") as? SKSpriteNode
        
        /* Create the smile */
        let smileCenter = CGPoint(x: -20, y: -100)
        let arcPath =  UIBezierPath(arcCenter: smileCenter, radius:30, startAngle: CGFloat.pi, endAngle: 0, clockwise:false)
        
        smileShapeNode = SKShapeNode(path: arcPath.cgPath)
        smileShapeNode.strokeColor = UIColor.yellow
        smileShapeNode.lineWidth = 5
        smileShapeNode.zPosition = (puppetSpriteNode?.zPosition)! + 1
        puppetSpriteNode?.addChild(smileShapeNode!)
    }
}
