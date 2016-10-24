//
//  SADayAndNightViewController.swift
//  SiaoApao
//
//  Created by Raúl López on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit
import SpriteKit

class SASheetViewController: BaseViewController {
    
    var game: Game!
    var showHomeButton : Bool?
    var skView : SKView!
    
    override func viewDidLoad() {
        skView = SKView(frame: UIScreen.main.bounds)
        self.view = skView
        super.viewDidLoad()
        
        self.menuView.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(SASheetViewController.close), name: NSNotification.Name(rawValue: "close"), object: nil)

        /* Init self.view to suport scence, beacuse this viewController is not use XIB */
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
        
        if skView.scene == nil {
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
        
        if skView.scene == nil {
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
        
        if skView.scene == nil {
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
        
        if skView.scene == nil {
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

extension SASheetViewController: MenuViewDelegate{
    
    func didPressSpanish() {
        let currentScene = skView.scene as! SABaseScene
        currentScene.updateLocalizableString()
    }
    
    func didPressEnglish() {
        let currentScene = skView.scene as! SABaseScene
        currentScene.updateLocalizableString()
    }
    
    func didPressHome() {
        close()
    }
    
    func didPressBack() {
        close()
    }
}
