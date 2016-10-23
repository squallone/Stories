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
        
        if self == "spanish" {
            // Get current Language
            let currentLanguage = Language.getLanguage(code: "ES", save: false)
            
            // Check value
            guard let language = currentLanguage else{
                return ""
            }
            
            return language.name
            
        }else if self == "english" {
            
            // Get current Language
            let currentLanguage = Language.getLanguage(code: "EN",  save: false)
            
            // Check value
            guard let language = currentLanguage else{
                return ""
            }
            
            return language.name
            
        }
        
        // Get current Language
        let currentLanguage = Language.current()
        
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
        
        return labelFound as! String
    }
}
