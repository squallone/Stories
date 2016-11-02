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
    
    // MARK: - Properties

    var flowController: SAMenuStoriesFlowController!
    
    // MARK: View fife cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign delegeate
        self.menuView.delegate = self
        // Navigation
        flowController = SAMenuStoriesFlowController(navigationController: self.navigationController)
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
    }
    
    // MARK: Stories
    
    @IBAction func showBeforeGoinTobed(_ sender: AnyObject) {
        
        let testViewController = SASheetViewController(nibName: "SASheetViewController", bundle: nil)
        let game = Game()
        game.scene = "catch_world"
        
        testViewController.game = game
        // Present ViewController
        self.navigationController?.pushViewController(testViewController, animated: true)
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
}

extension SAMenuStoriesViewController: MenuViewDelegate{
    
    func didPressSpanish() {
        self.updateLocalizableStrings()
    }
    
    func didPressEnglish() {
        self.updateLocalizableStrings()
    }
    
    func didPressBack() {
        flowController.showMenu()

    }
    
    func didPressHome() {
        flowController.showMenu()

    }
}
