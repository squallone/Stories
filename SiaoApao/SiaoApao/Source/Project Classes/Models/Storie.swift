//
//  Storie.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/19/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import ObjectMapper

class Storie: Mappable {

    dynamic var name   = ""
    dynamic var code   = ""
    dynamic var enable = ""

    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        name    <- map["name"]
        code    <- map["code"]
        enable  <- map["enable"]

    }
    
    
}
