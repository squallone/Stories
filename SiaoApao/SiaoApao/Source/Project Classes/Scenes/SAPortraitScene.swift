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
    
    // MARK: - Action
    var photoGirlAnimation: SKAction?
    var photoGirlTwoAnimation: SKAction?
    let zipperSound: SKAction = SKAction.playSoundFileNamed(
        "tired.wav", waitForCompletion: true)
    
    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init properties */
        photoGirl = self.childNode(withName: "photoGirl") as? SKSpriteNode
        photoGirlTwo = self.childNode(withName: "photoGirlTwo") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        photoGirl?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
        photoGirlTwo?.run(SKAction.repeatForever(bounceAction), withKey:"movingTwo")
    

       // 1
        var textures:[SKTexture] = []
        var texturesTwo:[SKTexture] = []
        // 2
        for i in 2...3 {
            textures.append(SKTexture(imageNamed: "PhotoGirl\(i)"))
            texturesTwo.append(SKTexture(imageNamed: "PhotoGirlTwo\(i)"))
        }
        
        // 4
        photoGirlAnimation = SKAction.animate(with: textures,
                                              timePerFrame: 0.2)
        photoGirlTwoAnimation = SKAction.animate(with: texturesTwo,
                                                 timePerFrame: 0.2)
        
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
                    let animationAction = selectPhotoNode == photoGirl ? photoGirlAnimation : photoGirlTwoAnimation
                    if (selectPhotoNode.hasActions()) {
                        selectPhotoNode.removeAllActions()
                        let groupAction = SKAction.group([animationAction!,zipperSound])
                        selectPhotoNode.run(groupAction)
                        
                        if self.checkPortraitIsTapped() {
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
        
        var firsPortraitIsTapped: Bool = true
        var secondPortraitIsTapped: Bool = true
        
        if (photoGirl?.action(forKey: "moving")) != nil {
            firsPortraitIsTapped = false
        }
        
        if (photoGirlTwo?.action(forKey: "movingTwo")) != nil {
            secondPortraitIsTapped = false
        }
        
        let allTortoiseIsPause = (firsPortraitIsTapped && secondPortraitIsTapped)
        return allTortoiseIsPause
    }
}
