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
        
        switch self.type {
        case .contactUs:
            
            let customView = ConctUsView.loadNib(viewModel: viewModel)
            self.view = customView
            
        case .theTeam:
            let customView = WebView.loadNib(viewModel: viewModel)
            let URLString = "\(Constants.HTTP.Endpoint)/team.html"
            let url = URL(string: URLString)
            customView.webView.loadRequest(URLRequest(url: url!))
            customView.isOpaque = false
            self.view = customView

        default:()
        }
        
        self.view.backgroundColor = UIColor.clear
    }
}
