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
    @IBOutlet weak var settingsMenuView: UIView!
    @IBOutlet weak var btnSpanish: UIButton!
    @IBOutlet weak var btnEnglish: UIButton!
    
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblStories: UILabel!
    @IBOutlet weak var lblGames: UILabel!
    @IBOutlet weak var lblcharacters: UILabel!
    @IBOutlet weak var btnTeam: UIButton!
    @IBOutlet weak var btnContactUs: UIButton!
    @IBOutlet weak var btnOptions: UIButton!
        
    // MARK: - Properties
    
    var flowController: SAMenuFlowController!
    
    // MARK: View fife cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup navigation
        flowController = SAMenuFlowController(navigationController: self.navigationController)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        self.btnSpanish.setTitle("spanish".localized, for: .normal)
        self.btnEnglish.setTitle("english".localized, for: .normal)
        self.btnTeam.setTitle("the_team".localized, for: .normal)
        self.btnContactUs.setTitle("contact_us".localized, for: .normal)

        self.lblLanguage.text   = "language".localized
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
        
    // MARK: - Menu Actions
    
    func goHome(){
        flowController.showMenu()
    }
    
    @IBAction func showSettings(_ sender: AnyObject) {
        settingsMenuView.isHidden = !settingsMenuView.isHidden
    }
    
    
    @IBAction func showTheTeam(_ sender: Any) {
        showSettings(sender as AnyObject)
        flowController.showTheTeam()

    }
    
    @IBAction func showContactUs(_ sender: Any) {
        showSettings(sender as AnyObject)
        flowController.showContactUs()
    }
    
    @IBAction func showOptions(_ sender: Any) {
        
    }
    
    // MARK: - Language
    
    @IBAction  func changeLanguageToSpanish(){

        // Save language code
        Language.saveCode(code: "ES")
        
        // Update strings
        self.updateLocalizableStrings()
    }
    
    @IBAction  func changeLanguageToEnglish(){
        
        // Save language code
        Language.saveCode(code: "EN")
        
        // Update strings
        self.updateLocalizableStrings()
    }
}
