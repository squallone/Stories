//
//  SACharactersFlowController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/9/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SACharactersFlowController: NSObject {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController!
    
    // MARK: - Instance
    
    init(navigationController: UINavigationController?){
        
        if navigationController != nil{
            self.navigationController = navigationController
        }
        
    }
    
    // MARK: - Navigation
    
    func back(){
        self.navigationController.popViewController(animated: true)
    }
    
    func showBiography(character: Character){
        let biographyViewcontroller = BiographyViewController(nibName: "BiographyViewController", bundle: nil)
        biographyViewcontroller.character = character
        self.navigationController.pushViewController(biographyViewcontroller, animated: true)
    }

}
