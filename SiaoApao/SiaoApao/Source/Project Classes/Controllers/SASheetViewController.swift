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
    
    // MARK: - IBOulets
    @IBOutlet weak var skView: SKView!
   // @IBOutlet weak var menuView: UIView!
    
    // MARK: - Properties
    var game: Game!
    var showHomeButton : Bool?

    // MARK: - View life cycle
    override func viewDidLoad() {
        
        self.isBackEnable = true
        super.viewDidLoad()
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        // Notification
        NotificationCenter.default.addObserver(self, selector: #selector(SASheetViewController.didPressBack), name: NSNotification.Name(rawValue: "close"), object: nil)
        
        /* Init self.view to suport scence, beacuse this viewController is not use XIB */
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
        case "sun_moon":
            dayNightScene()
        case "catch_world":
            catchWorld()

        default:
            break
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.menuView.btnHome?.addTarget(self, action: #selector(didPressHome), for: .touchUpInside)
        self.menuView.btnBack?.addTarget(self, action: #selector(didPressBack), for: .touchUpInside)
        self.menuView.btnSpanish?.addTarget(self, action: #selector(changeLanguage), for: .touchUpInside)
        self.menuView.btnEnglish?.addTarget(self, action: #selector(changeLanguage), for: .touchUpInside)

    }
    
    // MARK: - Scenes
    
    func dayNightScene(){
        
        if let scene = SADayAndNightScene(fileNamed:"SADayAndNightScene") {
                
            scene.showHomeButton = self.showHomeButton
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
    func catchWorld(){
        
        if let scene = SABookScene(fileNamed:"SABookScene") {
            
            scene.showHomeButton = self.showHomeButton
            scene.isSceneGame = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
    func bubbleScene(){

        if let scene = SASceneGlobes(fileNamed:"SASceneGlobes") {
            scene.showHomeButton = self.showHomeButton
            scene.isSceneGame = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
    func turtlesScene(){
        
        if let scene = SASurfScene(fileNamed:"SASurfScene") {
            scene.showHomeButton = self.showHomeButton
            scene.isSceneGame = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
    func danceTyroScene(){
        
        if let scene = SACarpetScene(fileNamed:"SACarpetScene") {
            scene.showHomeButton = self.showHomeButton
            scene.isSceneGame = true

            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
        }
    }
    
    
    // MARK: - Actions
    
    func changeLanguage() {
        let currentScene = skView.scene as! SABaseScene
        currentScene.updateLocalizableString()
    }
    
    func didPressHome() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    func didPressBack() {
       _ = self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


