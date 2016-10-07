//
//  SASurf.swift
//  SiaoApao
//
//  Created by Raul Lopez Martinez on 08/09/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit
import AVFoundation

class SASurfScene: SABaseScene {
    
    // MARK: - Properties
    var surfGirlNode: SKSpriteNode?
    var surfGirlTwoNode: SKSpriteNode?
    var tortoiseNode: SKSpriteNode?
    var tortoiseTwoNode: SKSpriteNode?
    var splashNode: SKSpriteNode?
    var splashTwoNode: SKSpriteNode?
    var splashTreeNode: SKSpriteNode?
    
    var backgroundMusicPlayer: AVAudioPlayer!
    
    let numberOfTouchToStop: NSInteger = 5

    /* Setup your scene here */
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        playBackgroundMusic(filename: "wave.wav")
        
        /* Init properties */
        tortoiseNode = self.childNode(withName: "tortoise") as? SKSpriteNode
        tortoiseTwoNode = self.childNode(withName: "TortoiseTwo") as? SKSpriteNode
        
        /* Create action */
        
        let rightRotateAction           = SKAction.rotate(byAngle: degToRad(-4.0), duration: 0.5)
        let getUpAction                 = SKAction.move(by: CGVector(dx:0, dy:10.0), duration: 0.5)
        let reverseRightRotateAction    = rightRotateAction.reversed()
        let leftRotateAction            = SKAction.rotate(byAngle: degToRad(4.0), duration: 0.5)
        let getDownAction               = SKAction.move(by: CGVector(dx:0, dy:-20.0), duration: 0.5)
        let reverseLeftRotateAction     = leftRotateAction.reversed()

        let sequenceArray = [rightRotateAction,
                             getUpAction,
                             reverseRightRotateAction,
                             leftRotateAction,
                             getDownAction,
                             reverseLeftRotateAction,
                             rightRotateAction,
                             getUpAction,
                             reverseRightRotateAction]
        
        let sequence = SKAction.sequence(sequenceArray)
        tortoiseNode?.run(SKAction.repeatForever(sequence), withKey:"moving")
        
        tortoiseTwoNode?.run(SKAction.wait(forDuration: 0.5), completion: {
            self.tortoiseTwoNode?.run(SKAction.repeatForever(sequence), withKey:"movingTwo")
        })
        
    }
    
    // MARK: - Gesture Actions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let location = touches.first?.location(in: self) {
            let touchedNode = atPoint(location)
            
            if touchedNode is SKSpriteNode {

                let selectTortoiseNode: SKNode
            
                if let parentNode = touchedNode.parent {
                    selectTortoiseNode = parentNode
                } else {
                    selectTortoiseNode = touchedNode
                }
            
                if selectTortoiseNode == tortoiseNode || selectTortoiseNode == tortoiseTwoNode {
                    /* Get the action Key */
                    let actionKey = selectTortoiseNode == tortoiseNode ? "moving" : "movingTwo"
                    
                    /* Get the node action */
                    if let nodeAction = selectTortoiseNode.action(forKey: actionKey) {
                        /* Calculate the speedProportion */
                        let speedProportion = 1 / CGFloat(numberOfTouchToStop)
                        let actualSpeed = Double(round(10 * nodeAction.speed) / 10)
                        let newSpeed = CGFloat(actualSpeed) - speedProportion
                        if newSpeed >= 0 {
                            nodeAction.speed = newSpeed
                        }
                    }
                    
                    if self.checkTortoisePause() {
                        print("Show next Button")
                    } else {
                        print("Hide next Button")
                    }
                }
            }
        }
    }
    
    /*Check if both tortoise is in pause */
    func checkTortoisePause() -> Bool {
        var firsTortoiseIsPause: Bool = false
        var secondTortoiseIsPause: Bool = false

        if let tortoiseNodeAction = tortoiseNode?.action(forKey: "moving") {
            firsTortoiseIsPause = tortoiseNodeAction.speed == 0 ? true : false
        }
        
        if let tortoiseSecondNodeAction = tortoiseTwoNode?.action(forKey: "movingTwo") {
            secondTortoiseIsPause = tortoiseSecondNodeAction.speed == 0 ? true : false
        }
        
        let allTortoiseIsPause = (firsTortoiseIsPause && secondTortoiseIsPause)
        return allTortoiseIsPause
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

