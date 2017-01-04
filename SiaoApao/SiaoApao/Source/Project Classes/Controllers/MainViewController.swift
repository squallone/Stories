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
    
    var alamofireManager: SessionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(delay: 4.0) {
            self.fetchLanguagesData()
        }
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
    
    // MARK: - Delay
    
    func delay(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    // MARK: - API
    
    func fetchLanguagesData(){
        
        HUD.show()

        let URL = Constants.HTTP.Endpoint + "/JsonSA"
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 180 // seconds
        
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
        
        alamofireManager.request(URL, method: .post).responseArray(keyPath: "languages") { (response: DataResponse<[Language]>) in
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
                let realm = try! Realm()

                let languages = realm.objects(Language.self)
                
                if languages.count > 0{
                    // Show Menu
                    self.showMainMenu()
                }else{
                    let alertController = UIAlertController(title: "Sia&Apao", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)

                    let okAction = UIAlertAction(title: "Retry", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                        self.fetchLanguagesData()
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
                HUD.hide()
            }
        }
    }
}
