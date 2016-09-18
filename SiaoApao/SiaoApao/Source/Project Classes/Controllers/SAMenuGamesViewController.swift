//
//  SAMenuGamesViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuGamesViewController: UIViewController {
    
    // MARK: Properties
    
    var flowController: SAMenuGamesFlowController!
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowController = SAMenuGamesFlowController(navigationController: self.navigationController)
    }
    
    // MARK: Actions
    
    @IBAction func showGameBubbles(_ sender: AnyObject) {
    }
    
    @IBAction func showGameCatchTheWorld(_ sender: AnyObject) {
    }
    
    @IBAction func showGameRideTheTurtles(_ sender: AnyObject) {
    }
    
    @IBAction func showGameDanceWithTyro(_ sender: AnyObject) {
        
    }
    
    // MARK: Navigation
    
    @IBAction func back(_ sender: AnyObject) {
        flowController.back()
    }
    
}
