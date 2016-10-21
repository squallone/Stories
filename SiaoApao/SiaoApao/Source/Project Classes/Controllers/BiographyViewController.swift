//
//  BiographyViewController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class BiographyViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    @IBOutlet weak var lblPhraseTitle: UILabel!
    @IBOutlet weak var lblPhraseDescription: UILabel!
    @IBOutlet weak var lblFoodTitle: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!
    
    // Menu labels
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblSpanish: UILabel!
    // View
    @IBOutlet weak var dropDownView: UIView!
    
    var character = Character()
    

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMenu()
        updateLocalizableStrings()

    }
    
    // MAKR: - Setup
    
    func setupMenu(){
        
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
    
    // MARK: - Language
    
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
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        lblHome.text       = "home".localized
        lblLanguage.text   = "language".localized
        lblEnglish.text    = "english".localized
        lblSpanish.text    = "spanish".localized
        
        lblTitle.text       = "biography".localized
        lblSubtitle.text    = "Example"
        lblPhraseTitle.text = "favourite_phrase".localized
        lblFoodTitle.text   = "favourite_food".localized

        lblName.text                = character.name
        lblDescription.text         = character.biography
        lblFoodDescription.text     = character.food
        lblPhraseDescription.text   = character.phrase
    }
    
    // MARK: - Actions
    
    @IBAction func back(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    // MARK: - Navigation
    
    func goHome(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showMenu(_ sender: AnyObject) {
        self.dropDownView.isHidden = self.dropDownView.isHidden ? false : true
        
    }
    
}
