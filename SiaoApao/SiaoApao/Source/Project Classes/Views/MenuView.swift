//
//  MenuView.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/16/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

@objc protocol MenuViewDelegate {
    
    @objc optional func didPressHome()
    @objc optional func didPressBack()
    @objc optional func didPressEnglish()
    @objc optional func didPressSpanish()
}

class MenuView: UIView {

    // MARK: - Properties
    
    var delegate: MenuViewDelegate?
    
    @IBOutlet weak var btnHome: UIButton?
    @IBOutlet weak var btnBack: UIButton?
    @IBOutlet weak var btnLanguage: UIButton!
    @IBOutlet weak var btnEnglish: UIButton!
    @IBOutlet weak var btnSpanish: UIButton!
    
    @IBOutlet weak var dropdownView: UIView!

    // MARK: - Lifecycle
    
    class func loadMenu(nibName: String) -> MenuView {
       
        let menuView = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as! MenuView
        menuView.updateLocalizableStrings()
        menuView.dropdownView.isHidden = true
        
        return menuView
    }
        
    class func loadMenu1() -> MenuView {
        
        return loadMenu(nibName: "MenuView")
    }
    
    class func loadMenu2() -> MenuView {
        
        return loadMenu(nibName: "Menu2View")

    }
    
    // MARK: - Labels
    
    func updateLocalizableStrings(){
        
        self.btnHome?.setTitle("home".localized, for: .normal)
        self.btnBack?.setTitle("back".localized, for: .normal)
        self.btnLanguage.setTitle("language".localized, for: .normal)
        self.btnEnglish.setTitle("english".localized, for: .normal)
        self.btnSpanish.setTitle("spanish".localized, for: .normal)
    }
    
    @IBAction func showMenu(_ sender: AnyObject) {
        
        self.dropdownView.isHidden = self.dropdownView.isHidden ? false : true
    }
    
    @IBAction func goHome(_ sender: AnyObject) {
        
        showMenu(self)
        if let didPressHome = self.delegate?.didPressHome{
            didPressHome()
        }
 
    }
    
    @IBAction func goBack(_ sender: AnyObject) {
        showMenu(self)
        
        if let didPressBack = self.delegate?.didPressBack{
            didPressBack()
        }
    }
    
    @IBAction func changeToEnglish(_ sender: AnyObject) {
        
        showMenu(self)
        // Save language code
        Language.saveCode(code: "EN")
        print("English selected")
        // Update labels
        self.updateLocalizableStrings()
        // Notify delegate
        if let didPressEnglish = self.delegate?.didPressEnglish{
            didPressEnglish()
        }
    }
    
    @IBAction func changeToSpanish(_ sender: AnyObject) {
        showMenu(self)

        // Save language code
        Language.saveCode(code: "ES")
        print("Spanish selected")
        // Update labels
        self.updateLocalizableStrings()
        // Notify delegate
        if let didPressSpanish = self.delegate?.didPressSpanish{
            didPressSpanish()
        }
    }
}
