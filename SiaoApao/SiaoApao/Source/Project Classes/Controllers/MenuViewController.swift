//
//  MenuViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/6/16.
//  Copyright © 2016 Raúl López. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var btnStories: UIButton!
    @IBOutlet weak var btnGames: UIButton!
    @IBOutlet weak var btnCharacters: UIButton!
    
    // MARK: - Properties
    
    var flowController: SAMenuFlowController!
    
    // MARK: View fife cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowController = SAMenuFlowController(navigationController: self.navigationController)
        
    }
    
    // MARK: - Navigation
    
    @IBAction func showStories(sender: AnyObject) {
        flowController.showStories()
    }
    
    @IBAction func showGames(sender: AnyObject) {
        flowController.showGames()
    }
    
    @IBAction func showCharacters(sender: AnyObject) {
        flowController.showCharacters()
        
    }
    
    // MARK: - Language
    
    @IBAction func changeLanguageToEnglish(sender: AnyObject) {
    }
    
    @IBAction func changeLanguageToSpanish(sender: AnyObject) {
        
    }
    
}
