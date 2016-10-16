//
//  SAPortraitScene.swift
//  SiaoApao
//
//  Created by Raul Lopez Martinez on 08/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SAPortraitScene: SABaseScene {
    // MARK: - Properties
    var photoGirl: SKSpriteNode?
    var photoGirlTwo: SKSpriteNode?
    var ballonNode: SKSpriteNode?
    
    // MARK: - Action
    var photoGirlNumberTouch: NSInteger = 2
    var photoGirlTwoNumberTouch: NSInteger = 2
    
    
    let zipperSound: SKAction = SKAction.playSoundFileNamed(
        "zipper.wav", waitForCompletion: true)
    let heySound: SKAction = SKAction.playSoundFileNamed(
        "hey.wav", waitForCompletion: true)
    

   override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.updateLocalizableString()
        
        /* Init properties */
        photoGirl = self.childNode(withName: "photoGirl") as? SKSpriteNode
        photoGirlTwo = self.childNode(withName: "photoGirlTwo") as? SKSpriteNode
        ballonNode = self.childNode(withName: "ballon") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        photoGirl?.run(SKAction.repeatForever(bounceAction))
        photoGirlTwo?.run(SKAction.repeatForever(bounceAction))
        
        /* Hidde ballon node */
        ballonNode?.alpha = 0.0
    }
    
    // MARK: - Labels
    
    func updateLocalizableString(){
        
        /* Title description */
        titleLabel.text = "scene_dress_instructions".localized
        label1.text = "scene_dress_text1".localized
        label2.text = "scene_dress_text2".localized
        label3.text = "scene_dress_text3".localized
        label4.text = "scene_dress_text4".localized
    }
    
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                let selectPhotoNode: SKNode
                
                if let parentNode = touchedNode.parent {
                    selectPhotoNode = parentNode
                } else {
                    selectPhotoNode = touchedNode
                }
                
                if selectPhotoNode == photoGirl || selectPhotoNode == photoGirlTwo {
                    let animationTouches = selectPhotoNode == photoGirl ? photoGirlNumberTouch : photoGirlTwoNumberTouch
                    var photoImageName = selectPhotoNode == photoGirl ? "PhotoGirl" : "PhotoGirlTwo"
                    
                    if (selectPhotoNode.hasActions()) {
                        selectPhotoNode.removeAllActions()
                        
                        if animationTouches > 0 {
                            let character = animationTouches == 2 ? "2": "3"
                            photoImageName.append(character)
                            
                            let newTexture = SKTexture.init(imageNamed: photoImageName)
                            let photoGirlAnimation = SKAction.setTexture(newTexture)
                            
                            let groupAction = SKAction.group([photoGirlAnimation,zipperSound])
                            selectPhotoNode.run(groupAction, completion: { 
                                if (animationTouches > 1) {
                                    let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
                                    selectPhotoNode.run(SKAction.repeatForever(bounceAction))
                                }
                            })
                            
                            /* Update Photo Touches */
                            if selectPhotoNode == photoGirl {
                                photoGirlNumberTouch = photoGirlNumberTouch - 1
                            } else {
                                photoGirlTwoNumberTouch = photoGirlTwoNumberTouch - 1
                            }
                        }

                        if self.checkPortraitIsTapped() {
                            let fadeInAction = SKAction.fadeIn(withDuration: 1.0)
                            let sequence = SKAction.group([heySound, fadeInAction])
                            ballonNode?.run(sequence)
                            
                            print("Show next Button")
                            
                        } else {
                            print("Hide next Button")
                        }
                    }
                }
            }
        }
    }
    
    /* Check if both portrats is in finish  */
    func checkPortraitIsTapped() -> Bool {
        
        var firsPortraitIsTapped: Bool = false
        var secondPortraitIsTapped: Bool = false
        
        if photoGirlNumberTouch == 0 {
            firsPortraitIsTapped = true
        }
        
        if photoGirlTwoNumberTouch == 0 {
            secondPortraitIsTapped = true
        }
        
        let allTortoiseIsPause = (firsPortraitIsTapped && secondPortraitIsTapped)
        return allTortoiseIsPause
    }
}
