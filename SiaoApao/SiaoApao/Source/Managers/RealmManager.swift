//
//  RealmManager.swift
//  Sia&Apao
//
//  Created by Abdiel Soto on 10/14/16.
//  Copyright © 2016 SmartDev. All rights reserved.
//

import RealmSwift

class RealmManager: NSObject {

    class func saveLanguages(_ languages: [Language]){
        
        do {
            let realm = try! Realm()
            try realm.write {
                for language in languages {
                    realm.add(language, update: true)
                    print("Updated \(language.code) language succesfully")
                }
            }
        } catch let error as NSError {
            print("Realm write error: \(error)")
            //TODO: Handle error
        }
    }
}
