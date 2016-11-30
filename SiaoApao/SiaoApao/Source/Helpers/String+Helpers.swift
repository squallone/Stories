//
//  String+Helpers.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 11/29/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//


extension String {
    mutating func replace(_ originalString:String, with newString:String) {
        self = self.replacingOccurrences(of: originalString, with: newString)
    }
}
