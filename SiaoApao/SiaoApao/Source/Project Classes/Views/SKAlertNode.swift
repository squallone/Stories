//
//  SKAlertNode.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/22/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SKAlertNode: SKScene {

    public var titleLabel: SKLabelNode!
    
    /* Local Constant */
    let titleFontSize : CGFloat = 37.0
    let buttonFontSize : CGFloat = 20.0
    
    override init () {
        super.init()
        
        // Background
        let background = SKShapeNode(rect: CGRect(x: 525, y: 140, width: size.width / 2, height:  size.height / 2), cornerRadius: 10)
        background.fillColor = UIColor(white: 1.0, alpha: 0.8)
        background.zPosition = 1
        
        self.addChild(background)
        
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

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
