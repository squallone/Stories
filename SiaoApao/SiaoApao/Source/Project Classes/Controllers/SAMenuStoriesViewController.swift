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
    
    // MARK: Stories
    
    @IBAction func showBeforeGoinTobed(sender: AnyObject) {
        
        let testViewController = SASheetViewController()
        // Present ViewController
        self.presentViewController(testViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func showDinnerAroundTheWorld(sender: AnyObject) {
        
    }
    
    
    @IBAction func showTheStoryBehindTheWorld(sender: AnyObject) {
    
    }
    
    // MARK: - Navigation
    
    @IBAction func showGames(sender: AnyObject) {
        flowController.showGames()
    }
    
    
    @IBAction func showCharacters(sender: AnyObject) {
        flowController.showCharacters()
        
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        flowController.showMenu()
        
    }
    
    
}
