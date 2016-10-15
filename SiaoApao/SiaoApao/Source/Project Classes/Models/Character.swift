//
//  Character.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/13/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Character: Object, Mappable {

    dynamic var name        = ""
    dynamic var phrase      = ""
    dynamic var food        = ""
    dynamic var biography   = ""

    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    func mapping(map: Map) {
        
        name        <- map["name"]
        phrase      <- map["phrase"]
        food        <- map["food"]
        biography   <- map["biography"]
    }
}
