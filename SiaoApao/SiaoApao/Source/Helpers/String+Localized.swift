//
//  String+Localized.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/14/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

extension String{
    
    var localized: String {
        
        // Get current Language
        let currentLanguage = Language.currentLanguage()
        
        // Check value
        guard let language = currentLanguage else{
            return ""
        }
        
        // Get labels dictionary
        let labelsDictionary = language.labels
        
        // Get label by key
        let label = labelsDictionary[self]
        
        guard let labelFound = label else{
            return ""
        }
        return labelFound
    }
}
