//
//  Character.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/13/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import ObjectMapper

class Character: Mappable {

    dynamic var name        = ""
    dynamic var phrase      = ""
    dynamic var food        = ""
    dynamic var biography   = ""

    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        name        <- map["name"]
        phrase      <- map["phrase"]
        food        <- map["food"]
        biography   <- map["biography"]
    }
}

extension Character{
    
    func update() -> Character{
        
        let lang = Language.current()
        
        guard let language = lang else {
            return Character()
        }
        
        let characters = language.characters
        
        if characters.contains(where: {$0.name == self.name}) {
            return $0
        } else {
            // item not found
        }
    }
    
}
