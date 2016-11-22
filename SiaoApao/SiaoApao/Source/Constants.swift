//
//  Constants.swift
//  SiaoApao
//
//  Created by Abdiel Soto on 9/6/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import UIKit

struct Constants{
    
    struct Appdelegate {
        static let Accessor = UIApplication.shared.delegate as! AppDelegate;
    }
    struct HTTP {
        static let Protocolo    = "http://"
        static let Host         = "52.88.85.62/"
        static let Port         = ""
        static let Path         = ""
        static let Endpoint     = Constants.HTTP.Protocolo + Constants.HTTP.Host + Constants.HTTP.Port + Constants.HTTP.Path
    }
}
