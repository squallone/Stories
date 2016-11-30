//
//  FormSheetViewController.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/20/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

enum FormSheetType{
    case contactUs
    case theTeam
    case options
}

import UIKit

class FormSheetViewController: UIViewController {
    
    var type: FormSheetType

    init(type: FormSheetType){
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewModel = SettingsViewModel()
        viewModel.didPressClose = {
            self.dismiss(animated: true, completion: nil)
        }
        
        viewModel.didPressFacebook = {
            UIApplication.shared.openURL(NSURL(string: "http://www.facebook.com/sia.and.apao")! as URL)
        }
        
        viewModel.didOpenEmail = {
            let email = "sia.and.apao@gmail.com"
            let url = NSURL(string: "mailto:\(email)")
            UIApplication.shared.openURL(url as! URL)
        }
        
        switch self.type {
        case .contactUs:
            
            let customView = ConctUsView.loadNib(viewModel: viewModel)
            self.view = customView
            
        case .theTeam:
            let customView = WebView.loadNib(viewModel: viewModel)
            
            customView.webView.loadHTMLString("team_credits".localized, baseURL: Bundle.main.bundleURL)
            customView.isOpaque = false
            self.view = customView

        default:()
        }
    }
}
