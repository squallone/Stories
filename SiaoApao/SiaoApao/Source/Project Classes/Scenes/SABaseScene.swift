//
//  SABaseScene.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SABaseScene: SKScene {
    
    public var nextButton: SKSpriteNode?

    override func didMove(to view: SKView) {
        
        // Back button
        if !self .isKind(of: SADayAndNightScene.self) {
            
            let backButton = SKSpriteNode(imageNamed: "LeftArrow")
            backButton.name = "back"
            backButton.position = CGPoint(x: 65, y: 65)
            backButton.zPosition = 10
            addChild(backButton)
        }
        
        // Next button
        
        nextButton = SKSpriteNode(imageNamed: "RightArrow")
        nextButton?.name = "next"
        nextButton?.position = CGPoint(x: size.width-65, y: 65)
        nextButton?.zPosition = 10
        addChild(nextButton!)
        
        // Title bar
        let titleBar = SKSpriteNode(imageNamed: "bar")
        titleBar.position = CGPoint(x: size.width / 2, y: 65)
        titleBar.setScale(1.17)
        titleBar.zPosition = 10
        addChild(titleBar)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode.name == "next" {
                
                let transition = SKTransition.reveal(with: .left, duration: 0.8)
                
                
                if self.isKind(of: SADayAndNightScene.self) {
                    if let nextScene = SASceneGlobes(fileNamed:"SASceneGlobes"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SASceneGlobes.self){
                    if let nextScene = SASurfScene(fileNamed:"SASurfScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SASurfScene.self){
                    if let nextScene = SAPortraitScene(fileNamed:"SAPortraitScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SAPortraitScene.self){
                    if let nextScene = SAPuppetScene(fileNamed:"SAPuppetScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SAPuppetScene.self){
                    if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SALivingRoomScene.self){
                    if let nextScene = SACarpetScene(fileNamed:"SACarpetScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SACarpetScene.self){
                    if let nextScene = SABookScene(fileNamed:"SABookScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SABookScene.self){
                    if let nextScene = ToothbrushScene(fileNamed:"ToothbrushScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: ToothbrushScene.self){
                    if let nextScene = SAFishbowlScene(fileNamed:"SAFishbowlScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SAFishbowlScene.self){
                    if let nextScene = SABearinBedScene(fileNamed:"SABearinBedScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }
                
            }else if touchedNode.name  == "back"{
                
                let transition = SKTransition.reveal(with: .right, duration: 0.8)
                
                if self.isKind(of: SASceneGlobes.self) {
                    if let nextScene = SADayAndNightScene(fileNamed:"SADayAndNightScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SASurfScene.self){
                    if let nextScene = SASceneGlobes(fileNamed:"SASceneGlobes"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SAPortraitScene.self){
                    if let nextScene = SASurfScene(fileNamed:"SASurfScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SAPuppetScene.self){
                    if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SALivingRoomScene.self){
                    if let nextScene = SAPuppetScene(fileNamed:"SAPuppetScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SACarpetScene.self){
                    if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SABookScene.self){
                    if let nextScene = SACarpetScene(fileNamed:"SACarpetScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: ToothbrushScene.self){
                    if let nextScene = SABookScene(fileNamed:"SABookScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SAFishbowlScene.self){
                    if let nextScene = ToothbrushScene(fileNamed:"ToothbrushScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKind(of: SABearinBedScene.self){
                    if let nextScene = SAFishbowlScene(fileNamed:"SAFishbowlScene"){
                        nextScene.scaleMode = .aspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }
            }
        }
    }
    
}
