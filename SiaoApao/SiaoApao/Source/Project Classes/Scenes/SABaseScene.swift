//
//  SABaseScene.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SABaseScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        // Back button
        if !self .isKindOfClass(SADayAndNightScene) {
            
            let backButton = SKSpriteNode(imageNamed: "LeftArrow")
            backButton.name = "back"
            backButton.position = CGPointMake(65, 65)
            backButton.zPosition = 10
            addChild(backButton)
        }
        
        // Next button
        
        let nextButton = SKSpriteNode(imageNamed: "RightArrow")
        nextButton.name = "next"
        nextButton.position = CGPointMake(size.width-65, 65)
        nextButton.zPosition = 10
        addChild(nextButton)
        
        // Title bar
        let titleBar = SKSpriteNode(imageNamed: "bar")
        titleBar.position = CGPointMake(size.width / 2, 65)
        titleBar.setScale(1.17)
        titleBar.zPosition = 10
        addChild(titleBar)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
            
            if touchedNode.name == "next" {
                
                let transition = SKTransition.revealWithDirection(.Left, duration: 0.8)
                
                
                if self.isKindOfClass(SADayAndNightScene) {
                    if let nextScene = SASceneGlobes(fileNamed:"SASceneGlobes"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SASceneGlobes){
                    if let nextScene = SASurfScene(fileNamed:"SASurfScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SASurfScene){
                    if let nextScene = SAPortraitScene(fileNamed:"SAPortraitScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SAPortraitScene){
                    if let nextScene = SAPuppetScene(fileNamed:"SAPuppetScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SAPuppetScene){
                    if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SALivingRoomScene){
                    if let nextScene = SACarpetScene(fileNamed:"SACarpetScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SACarpetScene){
                    if let nextScene = SABookScene(fileNamed:"SABookScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SABookScene){
                    if let nextScene = ToothbrushScene(fileNamed:"ToothbrushScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(ToothbrushScene){
                    if let nextScene = SAFishbowlScene(fileNamed:"SAFishbowlScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SAFishbowlScene){
                    if let nextScene = SABearinBedScene(fileNamed:"SABearinBedScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }
                
            }else if touchedNode.name  == "back"{
                
                let transition = SKTransition.revealWithDirection(.Right, duration: 0.8)
                
                if self.isKindOfClass(SASceneGlobes) {
                    if let nextScene = SADayAndNightScene(fileNamed:"SADayAndNightScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SASurfScene){
                    if let nextScene = SASceneGlobes(fileNamed:"SASceneGlobes"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SAPortraitScene){
                    if let nextScene = SASurfScene(fileNamed:"SASurfScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SAPuppetScene){
                    if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SALivingRoomScene){
                    if let nextScene = SAPuppetScene(fileNamed:"SAPuppetScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SACarpetScene){
                    if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SABookScene){
                    if let nextScene = SACarpetScene(fileNamed:"SACarpetScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(ToothbrushScene){
                    if let nextScene = SABookScene(fileNamed:"SABookScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SAFishbowlScene){
                    if let nextScene = ToothbrushScene(fileNamed:"ToothbrushScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }else if self.isKindOfClass(SABearinBedScene){
                    if let nextScene = SAFishbowlScene(fileNamed:"SAFishbowlScene"){
                        nextScene.scaleMode = .AspectFill
                        scene?.view?.presentScene(nextScene, transition: transition)
                    }
                }
            }
        }
    }
    
}
