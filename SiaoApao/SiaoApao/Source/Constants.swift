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
        static let Protocolo    = "https://"
        static let Host         = "jsonblob.com/"
        static let Port         = ""
        static let Path         = "api/blob/"
        static let Endpoint     = Constants.HTTP.Protocolo + Constants.HTTP.Host + Constants.HTTP.Port + Constants.HTTP.Path
    }
}
