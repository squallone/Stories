//
//  SAMenuStoriesViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuStoriesViewController: UIViewController {
    
    // MARK: - Properties
    
    var flowController: SAMenuStoriesFlowController!
    
    // MARK: View fife cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowController = SAMenuStoriesFlowController(navigationController: self.navigationController)
        
    }
    
    // MARK: - Navigation
    
    @IBAction func showGames(sender: AnyObject) {
        
    }
    
    
    @IBAction func showCharacters(sender: AnyObject) {
        
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        flowController.showMenu()
        
    }
    
}
