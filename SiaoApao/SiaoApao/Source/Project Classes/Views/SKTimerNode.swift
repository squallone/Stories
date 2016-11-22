//
//  SKTimerNode.swift
//  Sia&Apao
//
//  Created by Raul Lopez Martinez on 18/11/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import SpriteKit

class SKTimerNode: SKLabelNode {
    
    var totalTime: TimeInterval = 0
    private var currentTimer: Timer?
    
    override init () {
        super.init()

        /* Set Text */
        self.text = timeString(time: totalTime)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func starTimer() {
        currentTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                            target: self,
                                            selector: #selector(SKTimerNode.update),
                                            userInfo: nil,
                                            repeats: true)
    }
    
    func pauseTimer() {
        currentTimer?.invalidate()
    }
    
    func resetTimer() {
        totalTime = 0.0
    }
    
    
    func update() {
        totalTime += 1
        self.text = timeString(time: totalTime)
    }
    
    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        return String(format:"%02i:%02i",minutes,Int(seconds))
    }
    
}
