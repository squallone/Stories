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
        navigationController.navigationBar.hidden = true
        
        // Present ViewController
        self.controller.presentViewController(navigationController, animated: true, completion: nil)
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
}
