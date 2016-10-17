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
        
        // Hide menu
        self.dropDownView.isHidden = true
        
        // Update recognizers
        let tapHome = UITapGestureRecognizer(target: self, action:#selector(goHome))
        self.lblHome.addGestureRecognizer(tapHome)
        
        // Update recognizers
        let tapEnglish = UITapGestureRecognizer(target: self, action:#selector(changeLanguageToEnglish))
        self.lblEnglish.addGestureRecognizer(tapEnglish)
        
        // Update recognizers
        let tapSpanish = UITapGestureRecognizer(target: self, action:#selector(changeLanguageToSpanish))
        self.lblSpanish.addGestureRecognizer(tapSpanish)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateLocalizableStrings()
    }
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        self.lblHome.text       = "home".localized
        self.lblLanguage.text   = "language".localized
        self.lblEnglish.text    = "english".localized
        self.lblSpanish.text    = "spanish".localized
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

    
    @IBAction func showMenu(_ sender: AnyObject) {
        self.dropDownView.isHidden = self.dropDownView.isHidden ? false : true
    }
    
    // MARK: - Menu Actions
    
    func goHome(){
        flowController.back()
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
