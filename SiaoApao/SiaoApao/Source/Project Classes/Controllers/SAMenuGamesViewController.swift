//
//  SAMenuGamesViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuGamesViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblSpanish: UILabel!
    @IBOutlet weak var dropDownView: UIView!
    
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
