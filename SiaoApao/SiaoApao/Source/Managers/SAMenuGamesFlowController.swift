//
//  SAMenuGamesFlowController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/8/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuGamesFlowController: NSObject {
    
    // MARK: Properties
    
    var navigationController: UINavigationController!
    
    // MARK: - Instance
    
    init(navigationController: UINavigationController?){
        
        if navigationController != nil{
            self.navigationController = navigationController
        }
    }
    
    // MARK: - Navigation
    
    func back(){
        self.navigationController.popViewControllerAnimated(true)
    }
    
}