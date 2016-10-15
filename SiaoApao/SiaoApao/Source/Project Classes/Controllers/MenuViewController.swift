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
    
    @IBOutlet weak var lblStories: UILabel!
    @IBOutlet weak var lblGames: UILabel!
    @IBOutlet weak var lblcharacters: UILabel!
        
    // MARK: - Properties
    
    var flowController: SAMenuFlowController!
    
    // MARK: View fife cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flowController = SAMenuFlowController(navigationController: self.navigationController)
        
        //self.setupUI()
        self.updateLocalizableStrings()
    }
    
    // MARK: - UI
    
    func setupUI(){
        
        self.lblGames.layer.borderWidth         = 1.0
        self.lblStories.layer.borderWidth       = 1.0
        self.lblcharacters.layer.borderWidth    = 1.0
        
        self.lblGames.layer.borderColor      = UIColor.colorMenuLabels.cgColor
        self.lblStories.layer.borderColor    = UIColor.colorMenuLabels.cgColor
        self.lblcharacters.layer.borderColor = UIColor.colorMenuLabels.cgColor
    }
    
    // MARK: - Labels
    func updateLocalizableStrings(){
        self.lblGames.text      = "games".localized
        self.lblStories.text    = "stories".localized
        self.lblcharacters.text = "characters".localized
        
    }
    
    // MARK: - Navigation
    
    @IBAction func showStories(_ sender: AnyObject) {
        flowController.showStories()
    }
    
    @IBAction func showGames(_ sender: AnyObject) {
        flowController.showGames()
    }
    
    @IBAction func showCharacters(_ sender: AnyObject) {
        flowController.showCharacters()
        
    }
    
    // MARK: - Language
    
    @IBAction func changeLanguageToEnglish(_ sender: AnyObject) {
    }
    
    @IBAction func changeLanguageToSpanish(_ sender: AnyObject) {
        
    }
}
