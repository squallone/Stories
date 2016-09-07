//
//  SADayAndNightViewController.swift
//  SiaoApao
//
//  Created by Raúl López on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit
import SpriteKit

class SADayAndNightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /* Init self.view to suport scence, beacuse this viewController is not use XIB */
        self.view = SKView(frame: UIScreen.mainScreen().bounds)

        // width = 682 and height = 511 because is the "MainMenu.png" resolution (1x)
        let scene = SADayAndNightScene(size:CGSize(width: 910, height: 682))
        
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
