//
//  SADayAndNightViewController.swift
//  SiaoApao
//
//  Created by Raúl López on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit
import SpriteKit

class SASheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /* Init self.view to suport scence, beacuse this viewController is not use XIB */
        self.view = SKView(frame: UIScreen.mainScreen().bounds)

        
        
        //if let scene = SADayAndNightScene(fileNamed:"SADayAndNightScene") {
        if let scene = SASurfScene(fileNamed:"SASurfScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
        
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
        
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
        
            skView.presentScene(scene)
        }
    }
}
