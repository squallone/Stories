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
    let labelFontSize : CGFloat = 30.0
    let buttonFontSize : CGFloat = 20.0
    
    override init () {
        super.init()
        
        
        
        /* Set Text */
        titleLabel = SKLabelNode(text: "¡Felicidades!")
        titleLabel.position = CGPoint(x: 0, y: 0)
        titleLabel.horizontalAlignmentMode = .left
        titleLabel.fontSize = labelFontSize
        titleLabel.fontName = "ArialNarrow-Bold"
        titleLabel.fontColor = UIColor.colorLabels
        titleLabel.isUserInteractionEnabled = false
        addChild(titleLabel)
        
        /* retry Button*/
        retryButton = SKSpriteNode(imageNamed: "wood_Button")
        retryButton.position = CGPoint(x: 65, y: 65)
        retryButton.zPosition = 10
        addChild(retryButton)
        
        /* Text in button */
        let titleButtonLabel = SKLabelNode(text: "Reintentar")
        titleButtonLabel.position = CGPoint(x: retryButton.size.width / 2, y: retryButton.size.height / 2)
        titleButtonLabel.horizontalAlignmentMode = .center
        titleButtonLabel.verticalAlignmentMode = .center
        titleButtonLabel.fontSize = buttonFontSize
        titleButtonLabel.fontName = "ArialNarrow-Bold"
        titleLabel.fontColor = UIColor.black
        retryButton.addChild(titleButtonLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
