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
        
        
        let URL = "https://jsonblob.com/api/blob/57fdc4f3e4b0bcac9f7e12eb"
        
        Alamofire.request(URL).responseArray(keyPath: "languages") { (response: DataResponse<[Language]>) in
            
            switch response.result{
            case .success(let languages):
                
                do {
                    let realm = try! Realm()
                    try realm.write {
                        for language in languages {
                            realm.add(language, update: true)
                            print("added")
                        }
                    }
                } catch let error as NSError {
                    print(error)
                    //TODO: Handle error
                }
                
            case .failure(let error):
                print(error)
                
            }
            
            
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // Controller and NavigationController
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: menuViewController)
        
        // Hide navigation bar
        navigationController.navigationBar.isHidden = true
        
        // Present ViewController
        self.present(navigationController, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
