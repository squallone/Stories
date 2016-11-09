//
//  BiographyViewController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class BiographyViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    @IBOutlet weak var lblPhraseTitle: UILabel!
    @IBOutlet weak var lblPhraseDescription: UILabel!
    @IBOutlet weak var lblFoodTitle: UILabel!
    @IBOutlet weak var lblFoodDescription: UILabel!

    var character = Character()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Menu delegate
        self.menuView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLocalizableStrings()
        
        switch character.name {
        case "Sia":
            imageView.image = #imageLiteral(resourceName: "character_sia")
        case "Apao":
            imageView.image = #imageLiteral(resourceName: "character_apao")
        case "Tyro":
            imageView.image = #imageLiteral(resourceName: "character_tyro")
        case "Galileo":
            imageView.image = #imageLiteral(resourceName: "character_galileo")
        default: break
        }

    }

    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        lblTitle.text       = "biography".localized
        lblSubtitle.text    = "title".localized
        lblPhraseTitle.text = "favourite_phrase".localized
        lblFoodTitle.text   = "favourite_food".localized

        lblName.text                = character.name
        lblDescription.text         = character.biography
        lblFoodDescription.text     = character.food
        lblPhraseDescription.text   = character.phrase
    }
    
    @IBAction func readMore(_ sender: AnyObject) {
        let detailController = BiographyDetailViewController(nibName: "BiographyDetailViewController", bundle: nil)
        detailController.character = self.character
        self.navigationController?.pushViewController(detailController, animated: true)
    }

}

extension BiographyViewController: MenuViewDelegate{
    
    func didPressSpanish() {
        self.character = self.character.update()
        self.updateLocalizableStrings()
    }
    
    func didPressEnglish() {
        self.character = self.character.update()
        self.updateLocalizableStrings()
    }
    
    func didPressBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func didPressHome() {
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
}
