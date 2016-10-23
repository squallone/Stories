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
    
    var game: Game!
    var showHomeButton : Bool?
    
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
        
        switch self.game.scene {
        case "bubbles":
            bubbleScene()
        case "turtles":
            turtlesScene()
        case "dance":
            danceTyroScene()
        case "catch_world":
            dayNightScene()

        default:
            break
        }
       
    }
    
    func dayNightScene(){
        
        let skView = self.view as! SKView
        if skView.scene == nil {
            
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            if let scene = SADayAndNightScene(fileNamed:"SADayAndNightScene") {
                
                scene.showHomeButton = self.showHomeButton
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .aspectFill
                
                skView.presentScene(scene)
            }
        }
    }
    
    func bubbleScene(){
        
        let skView = self.view as! SKView
        if skView.scene == nil {
            
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            if let scene = SASceneGlobes(fileNamed:"SASceneGlobes") {
                scene.showHomeButton = self.showHomeButton

                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .aspectFill
                
                skView.presentScene(scene)
            }
        }
    }
    
    func turtlesScene(){
        
        let skView = self.view as! SKView
        if skView.scene == nil {
            
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            if let scene = SASurfScene(fileNamed:"SASurfScene") {
                scene.showHomeButton = self.showHomeButton

                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .aspectFill
                
                skView.presentScene(scene)
            }
        }
    }
    
    func danceTyroScene(){
        
        let skView = self.view as! SKView
        if skView.scene == nil {
            
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            if let scene = SACarpetScene(fileNamed:"SACarpetScene") {
                scene.showHomeButton = self.showHomeButton

                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .aspectFill
                
                skView.presentScene(scene)
            }
        }
    }
    
}
