//
//  WebView.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/21/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class WebView: UIView {

    @IBOutlet weak var webView: UIWebView!
    var viewModel: SettingsViewModel!

    // MARK: - Init
    
    class func loadNib(viewModel : SettingsViewModel) -> WebView{
        
        let view = UINib(nibName: "WebView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! WebView
        view.viewModel = viewModel
        
        return view
    }
    
    // MARK: - Actions
    
    @IBAction func didPressClose(_ sender: Any) {
        viewModel.didPressClose!()
    }
    
    

}
