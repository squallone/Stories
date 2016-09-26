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
    let stepNumber: NSInteger = 7
    
    var backgroundMusicPlayer: AVAudioPlayer!

    
    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        /* Init properties */
        dragonNode = self.childNode(withName: "dragon") as? SKSpriteNode
        
        /* Create Bounce Action */
        let bounceAction = SKAction.bounce(to: 1.005, duration: 0.2)
        dragonNode?.run(SKAction.repeatForever(bounceAction), withKey:"moving")
        
    }
    
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {
                
                if touchedNode == dragonNode  {
                    
                    if (touchedNode.hasActions()) {
                        touchedNode.removeAllActions()
                        
                        /* Create step Action*/
                        let stepSequence = SKAction.sequence([SKAction.rotate(byAngle: degToRad(-2.0), duration: 0.1),
                                                              SKAction.moveBy(x: 5, y: 0, duration: 0.1),
                                                              SKAction.rotate(byAngle: 0.0, duration: 0.1),
                                                              SKAction.moveBy(x: 5, y: 0, duration: 0.1),
                                                              SKAction.rotate(byAngle: degToRad(2.0), duration: 0.1),
                                                              SKAction.moveBy(x: 5, y: 0, duration: 0.1)])
                        
                        /* Crate Group Action */
                        let groupAction = SKAction.repeat(stepSequence, count: stepNumber)
                        
                        /* step walkSound */
                        self.playBackgroundMusic(filename: "walk.wav")
                        
                        dragonNode?.run(groupAction, completion: {
                            print("Finish")
                            let finalImage = UIImage.init(named: "TiredDragon")
                            self.dragonNode?.texture = SKTexture.init(image: finalImage!)

                        })
                        print("Show next Button")
                    } else {
                        print("Hide next Button")
                        
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
            backgroundMusicPlayer.numberOfLoops = stepNumber * 2
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch {
            print("Could not create audio player!")
            return
        }
    }

    
}
