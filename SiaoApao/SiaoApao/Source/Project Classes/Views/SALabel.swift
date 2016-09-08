//
//  SALabel.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SALabel: UILabel {
    
    var outlineWidth: CGFloat = 1
    var outlineColor: UIColor = UIColor.whiteColor()
    
    override func drawTextInRect(rect: CGRect) {
        
        let strokeTextAttributes = [
            NSStrokeColorAttributeName : outlineColor,
            NSStrokeWidthAttributeName : -1 * outlineWidth,
            ]
        
        self.attributedText = NSAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
        super.drawTextInRect(rect)
    }
}
