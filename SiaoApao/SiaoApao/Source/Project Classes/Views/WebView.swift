//
//  WebView.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/21/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class WebView: UIView {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var webView: UIWebView!
    var viewModel: SettingsViewModel!

    // MARK: - Init
    
    class func loadNib(viewModel : SettingsViewModel) -> WebView{
        
        let view = UINib(nibName: "WebView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! WebView
        view.viewModel = viewModel
        view.textView.attributedText = self.loadText()
        return view
    }
    
    // MARK: - Setup
    
    class func loadText() -> NSAttributedString{
    
        let paragraphNumber = Int("team_credits_number".localized)!
        let attributedString = NSMutableAttributedString(string: "")
        
        let attrs = [NSFontAttributeName : UIFont(name: "HelveticaNeue", size: 15)]
        let attrsBold = [NSFontAttributeName : UIFont(name: "HelveticaNeue-Bold", size: 15)]


        for i in 1...paragraphNumber{
            
            let titleString = "team_credits_titulo\(i)".localized
            let titleAttrString = NSMutableAttributedString(string:titleString, attributes:attrsBold)

            attributedString.append(titleAttrString)
            
            let contentString = "team_credits_contenido\(i)".localized
            let contentAttrString = NSMutableAttributedString(string: contentString, attributes: attrs)

            attributedString.append(contentAttrString)

            attributedString.append(NSMutableAttributedString(string: "\n\n"))

        }
        
        return attributedString
    }
    
    // MARK: - Actions
    
    @IBAction func didPressClose(_ sender: Any) {
        viewModel.didPressClose!()
    }
    
    

}
