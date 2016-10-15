//
//  SAMenuStoriesViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuStoriesViewController: UIViewController {
    
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
        
        flowController = SAMenuStoriesFlowController(navigationController: self.navigationController)
        self.updateLocalizableStrings()
    }
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        self.lblGames.text      = "games".localized
        self.lblStories.text    = "stories".localized
        self.lblCharacters.text = "characters".localized
        
        self.lblHome.text       = "Home"
        self.lblLanguage.text   = "Language"
        self.lblEnglish.text    = "English"
        self.lblSpanish.text    = "Spanish"
        
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
        flowController.showMenu()
        
    }
    
    
}
