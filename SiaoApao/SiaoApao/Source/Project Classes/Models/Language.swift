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
    
    // MARK: Properties
    
    dynamic var name        = ""
    dynamic var code        = ""
    var characters = List<Character>()
    private dynamic var labelsData: NSData?
    
    var labels: [String: String] {
        get {
            guard let labelsData = labelsData else {
                return [String: String]()
            }
            do {
                let dict = try JSONSerialization.jsonObject(with: labelsData as Data, options: []) as? [String: String]
                return dict!
            } catch {
                return [String: String]()
            }
        }
        
        set {
            do {
                let data = try JSONSerialization.data(withJSONObject: newValue, options: [])
                labelsData = data as NSData?
            } catch {
                labelsData = nil
            }
        }
    }
    
    //Impl. of Mappable protocol
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        name  <- map["language"]
        code  <- map["code"]
        
        let transform = TransformOf<NSData, [String: String]>(fromJSON: { (value: [String: String]?) -> NSData? in
            do {
                guard let json = value else{
                    return nil
                }
                
                let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                return data as NSData?
            } catch {
                return nil
            }
            
            }, toJSON: { (value: NSData?) -> [String: String]? in
                // transform value from NSData? to [String: String]?
                return nil
        })
        
        labelsData <- (map["data.labels"], transform)
        
        
        // Add comptibility with Realm, store Array of characters to List objects,
        let information = Mapper<Character>().mapArray(JSONArray: map["data.characters"].currentValue as! [[String : Any]])
        if let information = information {
            characters.append(objectsIn: information)
        }
    }
    
    // MARK: - Realm
    
    override static func primaryKey() -> String? {
        return "code"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["labels"]
    }
    
    class func save(_ languages: [Language]){
        
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
    
    
    // MARK: - Public methods
    
    class func current() -> Language?{
        
        let code = UserDefaults.standard.string(forKey: "language_selected")
        
        guard let codeSelected = code else{
            return nil
        }
        
        return getLanguage(code: codeSelected)
        
    }
    
    class func getLanguage(code: String) -> Language?{
        return self.getLanguage(code: code, save: true)
    }
    
    class func getLanguage(code: String, save: Bool) -> Language? {
        
        let realm = try! Realm()
        let language = realm.object(ofType: Language.self, forPrimaryKey: code)
        
        guard let lang = language else{
            return nil
        }
        
        if(save){
            self.saveCode(code: code)
        }
        
        return lang
    }
    
    class func saveCode(code: String){
    
        UserDefaults.standard.set(code, forKey: "language_selected")

    }
}
