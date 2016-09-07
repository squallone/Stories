//
//  SAMenuStoriesFlowController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class SAMenuStoriesFlowController: NSObject {
    
    var navigationController: UINavigationController!
    
    // MARK: - Instance
    
    init(navigationController: UINavigationController?){
        
        if navigationController != nil{
            self.navigationController = navigationController
        }
    }
    
    
    func showMenu(){
        self.navigationController.popViewControllerAnimated(true)
    }
}
