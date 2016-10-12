//
//  Language.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/12/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import ObjectMapper
import RealmSwift

class Language: Object, Mappable {
    dynamic var name      = ""
    dynamic var code      = ""

    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "code"
    }
    
    func mapping(map: Map) {
        
        name   <- map["language"]
        code   <- map["code"]
    }
    
}
