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
        
        name        <- map["language"]
        code        <- map["code"]
        
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
                // transform value from Int? to String?
                
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
    
    
    // MARK: - Public methods
    
    class func currentLanguage() -> Language?{
        
        let realm = try! Realm()
        let language = realm.object(ofType: Language.self, forPrimaryKey: "EN")
        
        guard let lang = language else{
            return nil
        }
        return lang
    }
}
