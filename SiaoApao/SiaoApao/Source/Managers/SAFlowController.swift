//
//  SAFlowController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/6/16.
//  Copyright © 2016 Raúl López. All rights reserved.
//

import UIKit

class SAFlowController: NSObject {
    
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
        
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        self.controller.presentViewController(menuViewController, animated: true, completion: nil)
    }
}
