//
//  SAMenuFlowController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuFlowController: NSObject {
    
    var navigationController: UINavigationController!
    var controller: UIViewController!
    
    // MARK: - Instance
    
    // NagivationViewControler
    init(navigationController: UINavigationController?){
        
        if navigationController != nil{
            self.navigationController = navigationController
            self.controller = navigationController?.viewControllers.first
        }
    }
    
    // ViewController
    init(controller: UIViewController?){
        
        if controller != nil{
            self.controller = controller
        }
    }
    
    // MARK: - Navigation
    
    func showMenu(){
        
        // Controller and NavigationController
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: menuViewController)
        
        // Hide navigation bar
        navigationController.navigationBar.isHidden = true
        
        // Present ViewController
        self.controller.present(navigationController, animated: true, completion: nil)
    }
    
    func showStories(){
        
        let menuStoriesViewController = SAMenuStoriesViewController(nibName: "SAMenuStoriesViewController", bundle: nil)
        self.navigationController.pushViewController(menuStoriesViewController, animated: true)
        
    }
    
    func showGames(){
        
        let menuStoriesViewController = SAMenuGamesViewController(nibName: "SAMenuGamesViewController", bundle: nil)
        self.navigationController .pushViewController(menuStoriesViewController, animated: true)
    }
    
    func showCharacters(){
        
        let menuStoriesViewController = SAMenuCharactersViewController(nibName: "SAMenuCharactersViewController", bundle: nil)
        self.navigationController .pushViewController(menuStoriesViewController, animated: true)
    }
    
    func showContactUs(){
        
        let formSheetViewController = FormSheetViewController(type: .contactUs)
        formSheetViewController.preferredContentSize = CGSize(width: self.controller.view.frame.width / 2, height: self.controller.view.frame.height/3)
        formSheetViewController.modalPresentationStyle = .formSheet
        
        self.controller.present(formSheetViewController, animated: true, completion: nil)
    }
    
    func showTheTeam(){
        
        let formSheetViewController = FormSheetViewController(type: .theTeam)
        formSheetViewController.preferredContentSize = CGSize(width: self.controller.view.frame.width / 1.5, height: self.controller.view.frame.height/1.5)
        formSheetViewController.modalPresentationStyle = .formSheet
        
        self.controller.present(formSheetViewController, animated: true, completion: nil)
    }
}
