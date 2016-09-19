//
//  File.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 18/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

extension SKTexture {
    /* FIXME
     This code breaks on iOS 8 (reference post)
     http://stackoverflow.com/questions/19243111/spritekit-sktexture-crash/19248293#19248293
     https://gist.github.com/ArtSabintsev/7a79ccd22f3bdb827b03
     */
    
    convenience init(size: CGSize, firstColor: UIColor, lastColor: UIColor) {
        
        guard let gradientFilter = CIFilter(name: "CILinearGradient") else {
            self.init()
            return
        }
        
        gradientFilter.setDefaults()
        
        let startVector = CIVector(x: size.width/2.0, y: 0)
        let endVector = CIVector(x: size.width/2.0, y: size.height)
        gradientFilter.setValue(startVector, forKey: "inputPoint0")
        gradientFilter.setValue(endVector, forKey: "inputPoint1")
        
        let transformedFirstColor = CIColor(color: firstColor)
        let transformedLastColor = CIColor(color: lastColor)
        gradientFilter.setValue(transformedFirstColor, forKey: "inputColor1")
        gradientFilter.setValue(transformedLastColor, forKey: "inputColor0")
        
        guard let outputImage = gradientFilter.outputImage else {
            self.init()
            return
        }
        
        let context = CIContext()
        let image = context.createCGImage(outputImage, from: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        self.init(cgImage: image!)
    }
}
