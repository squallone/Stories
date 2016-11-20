//
//  SACarpetScene.swift
//  SiaoApao
//
//  Created by Raul Lopez Martinez on 09/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit
import AVFoundation

class SACarpetScene: SABaseScene {
    
    // MARK: - Properties
    var dragonNode: SKSpriteNode?
    let stepNumber: Int = 7
    var numberOfTouches: Int = 5;
    var danceAction: SKAction!
    
    var backgroundMusicPlayer: AVAudioPlayer!
    let tiredSound: SKAction = SKAction.playSoundFileNamed(
        "tired.wav", waitForCompletion: false)
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        /* Init properties */
        dragonNode = self.childNode(withName: "dragon") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        dragonNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
        
        /* Create Dacen Action */
        /* Create step Action*/
        let stepSequence = SKAction.sequence([SKAction.rotate(byAngle: degToRad(-2.0), duration: 0.1),
                                              SKAction.moveBy(x: 5, y: 0, duration: 0.1),
                                              SKAction.rotate(byAngle: 0.0, duration: 0.1),
                                              SKAction.moveBy(x: 5, y: 0, duration: 0.1),
                                              SKAction.rotate(byAngle: degToRad(2.0), duration: 0.1),
                                              SKAction.moveBy(x: 5, y: 0, duration: 0.1)])
        let groupAction = SKAction.repeat(stepSequence, count: stepNumber)
        let groupActionReversed =  SKAction.repeat(stepSequence.reversed(), count: stepNumber)
        
        danceAction = SKAction.repeatForever(SKAction.sequence([groupAction,
                                                                groupActionReversed]))
    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_dance_instructions".localized
        label1.text = "scene_dance_text1".localized
        label2.text = "scene_dance_text2".localized
        label3.text = "scene_dance_text3".localized
        label4.text = "scene_dance_text4".localized
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                if touchedNode == dragonNode  {
                    
                    if ((touchedNode.action(forKey: "dace")) == nil) {
                        touchedNode.removeAllActions()
                        
                        self.playBackgroundMusic(filename: "dance.wav")
                        dragonNode?.run(danceAction, withKey: "dace")
                    
                    } else {
                        
                        /* Other Touches */
                        if numberOfTouches > 0 {
                            /* Resume Background Music */
                            backgroundMusicPlayer.play()
                        
                            /* Resume Dragon Dance Action */
                            dragonNode?.isPaused = false
                        
                        } else {
                            /* Stop background Sound */
                            backgroundMusicPlayer.stop()
                            
                            /* Resume Action (VERY IMPORTANT) */
                            dragonNode?.isPaused = false
                            
                            /* Stop Dance Action*/
                            let danceAction = dragonNode?.action(forKey: "dace")
                            danceAction?.speed = 0.0;
                            
                            let finalImage = UIImage.init(named: "TiredDragon")
                            let textureAction = SKAction.setTexture(SKTexture.init(image: finalImage!))
                            let groupAction = SKAction.group([textureAction, tiredSound])
                            dragonNode?.run(groupAction, completion: {
                                
                                // Show next button
                                self.showNextButton()
                            })
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        /* Pause Dragon Dance Action */
        self.dragonNode?.isPaused = true
        
        
        if self.backgroundMusicPlayer != nil{
            /* Puase Background Music */
            self.backgroundMusicPlayer.pause()
        }
        
        
        /* Decrement number of toches */
        self.numberOfTouches -= 1
    }
    
    
    func playBackgroundMusic(filename: String) {
        let resourceUrl = Bundle.main.url(
            forResource: filename, withExtension: nil)
        guard let url = resourceUrl else {
            print("Could not find file: \(filename)")
            return
        }
        
        do {
            try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch {
            print("Could not create audio player!")
            return
        }
    }

    
}
