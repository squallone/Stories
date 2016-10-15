//
//  BiographyViewController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class BiographyViewController: UIViewController {

    // Menu labels
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblSpanish: UILabel!
    
    // View
    @IBOutlet weak var dropDownView: UIView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func back(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    // MARK: - Navigation
}
