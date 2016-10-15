//
//  SAMenuCharactersViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuCharactersViewController: UIViewController {
    
    // MARK: - IBOutlets

    // Menu labels
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblLanguage: UILabel!
    @IBOutlet weak var lblEnglish: UILabel!
    @IBOutlet weak var lblSpanish: UILabel!
    
    // View
    @IBOutlet weak var dropDownView: UIView!
    
    // MARK: - Properties
    var flowController: SACharactersFlowController!
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowController = SACharactersFlowController(navigationController: self.navigationController)        
    }
    
    // MARK: - Navigation
    
    @IBAction func back(_ sender: AnyObject) {
        flowController.back()
    }
    
    @IBAction func pressApao(_ sender: AnyObject) {
        flowController.showBiography(character: "")
    }
    
    @IBAction func pressSia(_ sender: AnyObject) {
        flowController.showBiography(character: "")
    }
    
    @IBAction func presstyro(_ sender: AnyObject) {
        flowController.showBiography(character: "")
    }
    
    @IBAction func pressGalileo(_ sender: AnyObject) {
        flowController.showBiography(character: "")
    }    
}
