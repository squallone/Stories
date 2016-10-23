//
//  BiographyDetailViewController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/23/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class BiographyDetailViewController: BaseViewController {
    
    var character = Character()

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Menu delegate
        self.menuView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLocalizableStrings()
    }
    
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        lblTitle.text       = "biography".localized
        lblSubtitle.text    = "title".localized
        lblDescription.text = character.biography
    }
}


extension BiographyDetailViewController: MenuViewDelegate{
    
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

