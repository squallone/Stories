//
//  SAMenuCharactersViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit
@objc

class SAMenuCharactersViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Menu labels
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblSpanish: UILabel!
    
    // View
    @IBOutlet weak var dropDownView: UIView!
    
    // MARK: - Properties
    var flowController: SACharactersFlowController!
    var characters = [Character]()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupMenu()
        
        // Characters data
        let language    = Language.current()!
        self.characters = language.characters
        
        // Flow controller
        flowController = SACharactersFlowController(navigationController: self.navigationController)
        
        // Table View
        collectionView.register(UINib(nibName: "CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharacterCollectionViewCell")
        collectionView.delegate = self
    }
    
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
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        self.lblHome.text       = "home".localized
        self.lblLanguage.text   = "language".localized
        self.lblEnglish.text    = "english".localized
        self.lblSpanish.text    = "spanish".localized
    }
    
    // MARK: - Navigation
    
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

// MARK: - UICollection DataSource

extension SAMenuCharactersViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let character = characters[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        cell.lblName.text = character.name
        
        switch character.name {
        case "Sia":
            cell.characterImageView.image = #imageLiteral(resourceName: "character_sia")
        case "Apa":
            cell.characterImageView.image = #imageLiteral(resourceName: "character_apao")
        case "Tyro":
            cell.characterImageView.image = #imageLiteral(resourceName: "character_tyro")
        case "Galileo":
            cell.characterImageView.image = #imageLiteral(resourceName: "character_galileo")
        default: break
        }
        
        return cell
    }
}

// MARK: - UICollectionView Delegate

extension SAMenuCharactersViewController : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let character = characters[indexPath.row]
        flowController.showBiography(character: character)
    }
}

// MARK: - Flow Layout

extension SAMenuCharactersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 221, height: 224)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: self.view.frame.size.height / 8,
                            left: self.view.frame.size.width / 5,
                            bottom:  self.view.frame.size.height / 6,
                            right: self.view.frame.size.width / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.size.height / 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.view.frame.size.width / 6
        
    }
}
