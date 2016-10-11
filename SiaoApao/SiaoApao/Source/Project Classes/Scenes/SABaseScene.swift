//
//  SABaseScene.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SABaseScene: SKScene {
    
    // MARK: - Properties
    
    public var nextButton: SKSpriteNode?
    public var titleLabel: SKLabelNode!
    
    // MARK: - Actions
    
    override func didMove(to view: SKView) {
        
        // Back button
        if !self.isKind(of: SADayAndNightScene.self) {
            
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
        
        titleLabel = SKLabelNode(text: "")
        titleLabel.position = CGPoint(x: size.width / 2, y: 50)
        titleLabel.zPosition = 15
        titleLabel.fontName = "MyriadPro-Bold"
        titleLabel.fontColor = UIColor.white
        addChild(titleLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            changeScene(action: touchedNode.name!)
            
        }
    }
    
}

extension SABaseScene{
    
    func changeScene(action: String){
        
        let transitionNext = SKTransition.reveal(with: .left, duration: 0.8)
        let transitionBack = SKTransition.reveal(with: .right, duration: 0.8)

        switch self {
        case is SADayAndNightScene:
            if action == "next"{
                if let nextScene = SASceneGlobes(fileNamed:"SASceneGlobes"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }
            break
        case is SASceneGlobes:
            if action == "next"{
                if let nextScene = SASurfScene(fileNamed:"SASurfScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SADayAndNightScene(fileNamed:"SADayAndNightScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SASurfScene:
            if action == "next"{
                if let nextScene = SAPortraitScene(fileNamed:"SAPortraitScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SASceneGlobes(fileNamed:"SASceneGlobes"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SAPortraitScene:
            if action == "next"{
                if let nextScene = SAPuppetScene(fileNamed:"SAPuppetScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SASurfScene(fileNamed:"SASurfScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SAPuppetScene:
            if action == "next"{
                if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SAPortraitScene(fileNamed:"SAPortraitScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SALivingRoomScene:
            if action == "next"{
                if let nextScene = SACarpetScene(fileNamed:"SACarpetScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SAPuppetScene(fileNamed:"SAPuppetScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SACarpetScene:
            if action == "next"{
                if let nextScene = SABookScene(fileNamed:"SABookScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SALivingRoomScene(fileNamed:"SALivingRoomScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SABookScene:
            if action == "next"{
                if let nextScene = ToothbrushScene(fileNamed:"ToothbrushScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }

            }else if action == "back"{
                if let nextScene = SACarpetScene(fileNamed:"SACarpetScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is ToothbrushScene:
            if action == "next"{
                if let nextScene = SAFishbowlScene(fileNamed:"SAFishbowlScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SABookScene(fileNamed:"SABookScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SAFishbowlScene:
            if action == "next"{
                if let nextScene = SABearinBedScene(fileNamed:"SABearinBedScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = ToothbrushScene(fileNamed:"ToothbrushScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SABearinBedScene:
            if action == "next" {
                if let nextScene = SAKissBedScene(fileNamed:"SAKissBedScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SAFishbowlScene(fileNamed:"SAFishbowlScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SAKissBedScene:
            if action == "next" {
                if let nextScene = SASwitchScene(fileNamed:"SASwitchScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SABearinBedScene(fileNamed:"SABearinBedScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SASwitchScene:
            if action == "next" {
                if let nextScene = SAMoonSleepScene(fileNamed:"SAMoonSleepScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            }else if action == "back"{
                if let nextScene = SAKissBedScene(fileNamed:"SAKissBedScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break
        case is SAMoonSleepScene:
            if action == "next" {
                if let nextScene = SAEndScene(fileNamed:"SAEndScene"){
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionNext)
                }
            } else if action == "back" {
                if let nextScene = SASwitchScene(fileNamed:"SASwitchScene") {
                    nextScene.scaleMode = .aspectFill
                    scene?.view?.presentScene(nextScene, transition: transitionBack)
                }
            }
            break

            
        default:
            break
        }
        
    }
}
