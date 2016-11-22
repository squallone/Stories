//
//  BaseViewController.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/7/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var menuView : MenuView!
    var isBackEnable: Bool?
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        self.menuView = MenuView.loadMenu()
        
        self.menuView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.menuView)
        
        // Constraints
        let views: [String: UIView] = ["menuView": self.menuView]
        
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[menuView(203)]|", options: .alignAllCenterX, metrics: [:], views: views)
        constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[menuView(395)]" , options: .alignAllCenterX, metrics: [:], views: views))
        
        for c in constraints {
            c.isActive = true
        }

        // Do any additional setup after loading the view.
    }
}
