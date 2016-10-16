//
//  HUD.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/15/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit
import ARSLineProgress

class HUD: NSObject {
    
    class func show(){
    
        ARSLineProgress.show()
    }

    class func hide(){
        ARSLineProgress.hide()
    }
}
