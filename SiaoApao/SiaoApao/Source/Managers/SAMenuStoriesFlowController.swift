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
        self.navigationController.popViewController(animated: true)
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
