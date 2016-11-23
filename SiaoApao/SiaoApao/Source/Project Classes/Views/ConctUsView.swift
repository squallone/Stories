//
//  ConctUsView.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/20/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

class ConctUsView: UIView {
    
    var viewModel: SettingsViewModel!
    
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var lblContactUs: UILabel!
    
    class func loadNib(viewModel : SettingsViewModel) -> ConctUsView{
        
        let view = UINib(nibName: "ConctUsView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! ConctUsView
        view.viewModel = viewModel
        view.lblContactUs.text = "contact_us".localized
        return view
    }

    @IBAction func didPressClose(_ sender: Any) {
        
       viewModel.didPressClose?()
    }
    
    @IBAction func didPressFB(_ sender: Any) {
        viewModel.didPressFacebook?()

    }
    @IBAction func didOpenEmail(_ sender: Any) {
        viewModel.didOpenEmail?()
    }
}

struct SettingsViewModel{
    var didPressClose: (() -> Void)? = nil
    var didPressFacebook: (() -> Void)? = nil
    var didOpenEmail:(() -> Void)? = nil

}
