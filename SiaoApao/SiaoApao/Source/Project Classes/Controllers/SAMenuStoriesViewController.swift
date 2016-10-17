//
//  SAMenuStoriesViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuStoriesViewController: BaseViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var lblStories: UILabel!
    @IBOutlet weak var lblGames: UILabel!
    @IBOutlet weak var lblCharacters: UILabel!
    
    // Menu labels
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblSpanish: UILabel!
    
    // View
    @IBOutlet weak var dropDownView: UIView!
    
    // MARK: - Properties

    var flowController: SAMenuStoriesFlowController!
    
    // MARK: View fife cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation
        flowController = SAMenuStoriesFlowController(navigationController: self.navigationController)

        // Hide menu
        self.dropDownView.isHidden = true
        
        // Update recognizers
        let tapHome = UITapGestureRecognizer(target: self, action:#selector(SAMenuStoriesViewController.goHome))
        self.lblHome.addGestureRecognizer(tapHome)
        
        // Update recognizers
        let tapEnglish = UITapGestureRecognizer(target: self, action:#selector(SAMenuStoriesViewController.changeLanguageToEnglish))
        self.lblEnglish.addGestureRecognizer(tapEnglish)
        
        // Update recognizers
        let tapSpanish = UITapGestureRecognizer(target: self, action:#selector(SAMenuStoriesViewController.changeLanguageToSpanish))
        self.lblSpanish.addGestureRecognizer(tapSpanish)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateLocalizableStrings()
    }
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        self.lblGames.text      = "games".localized
        self.lblStories.text    = "stories".localized
        self.lblCharacters.text = "characters".localized
        
        self.lblHome.text       = "home".localized
        self.lblLanguage.text   = "language".localized
        self.lblEnglish.text    = "english".localized
        self.lblSpanish.text    = "spanish".localized
    }
    
    // MARK: Stories
    
    @IBAction func showBeforeGoinTobed(_ sender: AnyObject) {
        
        let testViewController = SASheetViewController()
        // Present ViewController
        self.present(testViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func showDinnerAroundTheWorld(_ sender: AnyObject) {
        
    }
    
    
    @IBAction func showTheStoryBehindTheWorld(_ sender: AnyObject) {
    
    }
    
    // MARK: - Navigation
    
    @IBAction func showGames(_ sender: AnyObject) {
        flowController.showGames()
    }
    
    
    @IBAction func showCharacters(_ sender: AnyObject) {
        flowController.showCharacters()
        
    }
    
    @IBAction func showMenu(_ sender: AnyObject) {
        
        self.dropDownView.isHidden = self.dropDownView.isHidden ? false : true

    }
    
    // MARK: - Menu Actions
    
    func goHome(){
        flowController.showMenu()
    }
    
    func changeLanguageToSpanish(){
        
        // Hide menu
        self.dropDownView.isHidden = true
        // Save language code
        Language.saveCode(code: "ES")
        // Update strings
        self.updateLocalizableStrings()
        
    }
    
    func changeLanguageToEnglish(){
        
        // Hide menu
        self.dropDownView.isHidden = true
        // Save language code
        Language.saveCode(code: "EN")
        // Update strings
        self.updateLocalizableStrings()
    }
    
}
