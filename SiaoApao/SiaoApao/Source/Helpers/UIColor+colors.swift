//
//  UIColor+colors.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/14/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

extension UIColor {
    static func color(redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: redValue/255.0, green: greenValue/255.0, blue: blueValue/255.0, alpha: alpha)
    }
    
   class var colorMenuLabels : UIColor{
        return UIColor.color(redValue: 128.0, greenValue: 155.0, blueValue: 28, alpha: 1.0)
    }
    
}
