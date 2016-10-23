//
//  SAMenuStoriesFlowController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuStoriesFlowController: NSObject {
    
    // MARK: Properties
    
    var navigationController: UINavigationController!
    
    // MARK: - Instance
    
    init(navigationController: UINavigationController?){
        
        if navigationController != nil{
            self.navigationController = navigationController
        }
    }
    
    // MARK: - Navigation
    
    func showMenu(){
        self.navigationController.popToRootViewController(animated: true)
    }
    
    func showBack(){
        self.navigationController.popViewController(animated: true)
    }
    
    func showGames(){
        
        let menuGamesViewController = SAMenuGamesViewController(nibName: "SAMenuGamesViewController", bundle: nil)
        menuGamesViewController.isBackEnable = true
        self.navigationController .pushViewController(menuGamesViewController, animated: true)
    }
    
    func showCharacters(){
        
        let menuCharactersViewController = SAMenuCharactersViewController(nibName: "SAMenuCharactersViewController", bundle: nil)
        menuCharactersViewController.isBackEnable = true
        self.navigationController .pushViewController(menuCharactersViewController, animated: true)
        
    }
}
