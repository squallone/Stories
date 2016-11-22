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
    var carpetGirl: SKSpriteNode?
    var carpetGirlTwo: SKSpriteNode?
    let stepNumber: Int = 7
    var numberOfTouches: Int = 8;
    var danceAction: SKAction!
    
    var backgroundMusicPlayer: AVAudioPlayer!
    let tiredSound: SKAction = SKAction.playSoundFileNamed(
        "tired.wav", waitForCompletion: false)
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Localizable string*/
        self.updateLocalizableString()
        
        /* Load backgroud music */
        self.playBackgroundMusic(filename: "dance.wav")
        
        /* Init properties */
        dragonNode = self.childNode(withName: "dragon") as? SKSpriteNode
        carpetGirl = self.childNode(withName: "carpetGirl") as? SKSpriteNode
        carpetGirlTwo  = self.childNode(withName: "carpetGirlTwo") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.01, duration: 0.2)
        dragonNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
        
        
        /* Create Dragon Dance Action */
        /* Create step Action */
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
        
        /* Dance girl */
        let rightRotateAction           = SKAction.rotate(byAngle: degToRad(-1.0), duration: 0.2)
        let reverseRightRotateAction    = rightRotateAction.reversed()
        let leftRotateAction            = SKAction.rotate(byAngle: degToRad(1.0), duration: 0.2)
        let reverseLeftRotateAction     = leftRotateAction.reversed()
        let getUpAction                 = SKAction.move(by: CGVector(dx:0, dy:5.0), duration: 0.1)
        let getDownAction               = SKAction.move(by: CGVector(dx:0, dy:-10.0), duration: 0.1)

        let sequenceGirlArray = [rightRotateAction,
                                 reverseRightRotateAction,
                                 leftRotateAction,
                                 reverseLeftRotateAction,
                                 getUpAction,
                                 rightRotateAction,
                                 reverseRightRotateAction,
                                 getDownAction,
                                 leftRotateAction,
                                 reverseLeftRotateAction,
                                 getUpAction]
        
        let stepTwoSequenceAction = SKAction.sequence(sequenceGirlArray)
       carpetGirl?.run(SKAction.repeatForever(stepTwoSequenceAction))
        
        /* Dance girl two*/
        let sequenceGirlTwoArray = [stepSequence,
                                    stepSequence.reversed()];
        let stepThreeSequenceAction = SKAction.sequence(sequenceGirlTwoArray)
        carpetGirlTwo?.run(SKAction.repeatForever(stepThreeSequenceAction))

    }
    
    // MARK: - Labels
    
    override func updateLocalizableString(){
        super.updateLocalizableString()

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
                        
                        dragonNode?.run(danceAction, withKey: "dace")
                        let waitAction = SKAction.wait(forDuration: 2.0)
                        dragonNode?.run(waitAction, completion: {
                            /* Pause Dragon Dance Action */
                            self.dragonNode?.isPaused = true
                            
                            /* Decrement number of toches */
                            self.numberOfTouches -= 1
                        })
                    
                    } else {
                        
                        /* Other Touches */
                        if numberOfTouches > 0 {
                            
                            if self.dragonNode?.isPaused == true {
                           
                                /* Resume Dragon Dance Action */
                                dragonNode?.isPaused = false
                                
                                let waitAction = SKAction.wait(forDuration: 2.0)
                                dragonNode?.run(waitAction, completion: {
                                    /* Pause Dragon Dance Action */
                                    self.dragonNode?.isPaused = true
                                    
                                    /* Decrement number of toches */
                                    self.numberOfTouches -= 1
                                })
                            }
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
                                
                                self.carpetGirl?.removeAllActions()
                                self.carpetGirlTwo?.removeAllActions()
                                
                                // Show next button
                                self.showNextButton()
                            })
                        }
                    }
                }
            }
        }
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
