//
//  SADayAndNightScene.swift
//  SiaoApao
//
//  Created by Raúl López on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

// MARK: - Margin Enum

enum Margin {
    static let girlMarginX: CGFloat = 210.0
    static let girlPositionY: CGFloat = 255.0
}

// MARK: - Scale Enum

enum Scale {
    static let girls:CGFloat = 0.8
}

// MARK: - z Node position  Enum

enum zNodePosition {
    static let fence: CGFloat = -1
    static let tree: CGFloat = -0.7
    static let fenceGirls: CGFloat = -0.5
    static let interaction: CGFloat = 0.0
    static let square: CGFloat = 0.5
    static let sink: CGFloat = 1.0
}


class SADayAndNightScene: SKScene {
    /* Setup your scene here */
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blueColor()
        
        /* Create node statics */
        
        let fenceNode = SKSpriteNode(imageNamed: "fence")
        fenceNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        fenceNode.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        fenceNode.zPosition = zNodePosition.fence
        addChild(fenceNode)
        
        let treeNode = SKSpriteNode(imageNamed: "tree")
        treeNode.position = CGPoint(x: size.width / 2, y: size.height / 2 + 90)
        treeNode.anchorPoint = CGPoint(x:0.5, y:0.5)
        treeNode.zPosition = zNodePosition.tree
        addChild(treeNode)
        
        let fenceGirl = SKSpriteNode(imageNamed: "FenceGirl")
        fenceGirl.position = CGPoint(x: Margin.girlMarginX, y: Margin.girlPositionY)
        fenceGirl.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fenceGirl.setScale(Scale.girls)
        fenceGirl.zPosition = zNodePosition.fenceGirls
        addChild(fenceGirl)
        
        let fenceGirl2 = SKSpriteNode(imageNamed: "FenceGirl2")
        fenceGirl2.position = CGPoint(x: size.width - Margin.girlMarginX, y: Margin.girlPositionY)
        fenceGirl2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        fenceGirl2.setScale(Scale.girls)
        fenceGirl2.zPosition = zNodePosition.fenceGirls
        addChild(fenceGirl2)
        
        let squareNode = SKSpriteNode(imageNamed:"square")
        squareNode.position = CGPoint(x: 0, y: size.height)
        squareNode.anchorPoint = CGPoint(x: 0, y: 1)
        squareNode.zPosition = zNodePosition.square
        addChild(squareNode)

        let sinkNode = SKSpriteNode(imageNamed: "sink")
        sinkNode.position = CGPoint(x: 0, y:0)
        sinkNode.anchorPoint = CGPoint(x: 0, y:0)
        sinkNode.zPosition = zNodePosition.sink
        addChild(sinkNode)
        
        
    }
}
