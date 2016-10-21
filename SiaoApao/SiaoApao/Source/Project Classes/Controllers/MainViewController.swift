//
//  MainViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/6/16.
//  Copyright © 2016 Raúl López. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RealmSwift

class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let URL = "http://52.88.85.62/JsonSA"
        
        HUD.show()
        
        Alamofire.request(URL, method: .post).responseArray(keyPath: "languages") { (response: DataResponse<[Language]>) in
            switch response.result{
            case .success(let languages):
                
                // Hide HUD
                HUD.hide()
                
                // Save languages
                Language.save(languages)
                
                // Set default language code
                Language.saveCode(code: "EN")
                
                // Show Menu
                self.showMainMenu()
                
            case .failure(let error):
                print("Alamofire error: \(error)")
                
            
                HUD.hide()

            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.showMainMenu()

    }
    
     // MARK: - Navigation
     
    func showMainMenu(){
        
        // Controller and NavigationController
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: menuViewController)
        
        // Hide navigation bar
        navigationController.navigationBar.isHidden = true
        
        // Present ViewController
        self.present(navigationController, animated: true, completion: nil)
        
    }
 
}
