//
//  BiographyDetailViewController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/23/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class BiographyDetailViewController: UIViewController {
    
    var character = Character()

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblDescription: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLocalizableStrings()
    }
    
    
    @IBAction func back(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        lblTitle.text       = "biography".localized
        lblSubtitle.text    = "title".localized
        lblDescription.text = character.biography
    }
}


