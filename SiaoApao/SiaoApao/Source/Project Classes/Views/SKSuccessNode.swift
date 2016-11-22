//
//  SKSuccessNode.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 21/11/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SKSuccessNode: SKNode {
    
    public var titleLabel: SKLabelNode!
    public var retryButton: SKSpriteNode!
    
    /* Local Constant */
    let titleFontSize : CGFloat = 47.0
    let buttonFontSize : CGFloat = 20.0
    
    override init () {
        super.init()
        
        /* retry Button*/
        let backgroundNode = SKSpriteNode(imageNamed: "menu_back_stories")
        backgroundNode.zPosition = -1
        addChild(backgroundNode)
        
        
        /* Set Text */
        titleLabel = SKLabelNode(text: "game_congratulations".localized)
        titleLabel.position = CGPoint(x: 0, y: 28)
        titleLabel.horizontalAlignmentMode = .center
        titleLabel.verticalAlignmentMode = .center
        titleLabel.fontSize = titleFontSize
        titleLabel.fontName = "ArialNarrow-Bold"
        titleLabel.fontColor = UIColor.colorLabels
        titleLabel.isUserInteractionEnabled = false
        addChild(titleLabel)
        
        /* retry Button*/
        retryButton = SKSpriteNode(imageNamed: "wood_Button")
        retryButton.position = CGPoint(x: 0, y: -45)
        retryButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(retryButton)
        
        /* Text in button */
        let titleButtonLabel = SKLabelNode(text: "game_retry".localized)
        titleButtonLabel.name = "retryScene"
        titleButtonLabel.zPosition = 1.0
        titleButtonLabel.position = CGPoint(x: 0, y: 0)
        titleButtonLabel.horizontalAlignmentMode = .center
        titleButtonLabel.verticalAlignmentMode = .center
        titleButtonLabel.fontSize = buttonFontSize
        titleButtonLabel.fontName = "ArialNarrow-Bold"
        titleButtonLabel.fontColor = UIColor.white
        retryButton.addChild(titleButtonLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
