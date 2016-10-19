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
        NotificationCenter.default.addObserver(self, selector: #selector(SASheetViewController.close), name: NSNotification.Name(rawValue: "close"), object: nil)

        /* Init self.view to suport scence, beacuse this viewController is not use XIB */
        self.view = SKView(frame: UIScreen.main.bounds)
    }
    
    func close(){
       self.dismiss(animated: true, completion: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let skView = self.view as! SKView
        if skView.scene == nil {
            
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            if let scene = SAMoonSleepScene(fileNamed:"SAMoonSleepScene") {
                
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .aspectFill
                
                skView.presentScene(scene)
            }
        }
    }
}
