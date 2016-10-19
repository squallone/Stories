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
    private dynamic var labelsData: NSData?
    private dynamic var charactersData: NSData?
    private dynamic var gamesData: NSData?
    private dynamic var storiesData: NSData?

    // MARK: - Labels
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
    
    var characters: [Character] {
        get {
            guard let charactersData = charactersData else {
                return [Character]()
            }
            do {
                let dict = try JSONSerialization.jsonObject(with: charactersData as Data, options: []) as? [[String: String]]
                
                let information = Mapper<Character>().mapArray(JSONObject: dict)
                if let array = information {
                    return array
                }else{
                    return [Character]()
                }
                
            } catch {
                return [Character]()
            }
        }
        
        set {
            do {
                let data = try JSONSerialization.data(withJSONObject: newValue, options: [])
                charactersData = data as NSData?
            } catch {
                charactersData = nil
            }
        }
    }
    
    
    var games: [Game] {
        get {
            guard let gamesData = gamesData else {
                return [Game]()
            }
            do {
                let dict = try JSONSerialization.jsonObject(with: gamesData as Data, options: []) as? [[String: String]]
                
                let information = Mapper<Game>().mapArray(JSONObject: dict)
                if let array = information {
                    return array
                }else{
                    return [Game]()
                }
                
            } catch {
                return [Game]()
            }
        }
        
        set {
            do {
                let data = try JSONSerialization.data(withJSONObject: newValue, options: [])
                gamesData = data as NSData?
            } catch {
                gamesData = nil
            }
        }
    }
    
    var stories: [Storie] {
        get {
            guard let storiesData = storiesData else {
                return [Storie]()
            }
            do {
                let dict = try JSONSerialization.jsonObject(with: storiesData as Data, options: []) as? [[String: String]]
                
                let information = Mapper<Storie>().mapArray(JSONObject: dict)
                if let array = information {
                    return array
                }else{
                    return [Storie]()
                }
                
            } catch {
                return [Storie]()
            }
        }
        
        set {
            do {
                let data = try JSONSerialization.data(withJSONObject: newValue, options: [])
                storiesData = data as NSData?
            } catch {
                storiesData = nil
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
        
        let transformJSONObject = TransformOf<NSData, [String: String]>(fromJSON: { (value: [String: String]?) -> NSData? in
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
        
        labelsData <- (map["data.labels"], transformJSONObject)
        
        
        let transformJSONArray = TransformOf<NSData, [[String: String]]>(fromJSON: { (value: [[String: String]]?) -> NSData? in
            do {
                guard let json = value else{
                    return nil
                }
                
                let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                return data as NSData?
            } catch {
                return nil
            }
            
            }, toJSON: { (value: NSData?) -> [[String: String]]? in
                // transform value from NSData? to [String: String]?
                return nil
        })
        
        charactersData <- (map["data.characters"], transformJSONArray)
        gamesData      <- (map["data.games"], transformJSONArray)
        storiesData    <- (map["data.stories"], transformJSONArray)

        
    }
    
    // MARK: - Realm
    
    override static func primaryKey() -> String? {
        return "code"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["labels", "characters", "games", "stories"]
    }
    
    class func save(_ languages: [Language]){
        
        do {
            let realm = try! Realm()
            try realm.write {
                for language in languages {
                    realm.add(language, update: true)
                    print("Updated \(language.code) language succesfully")
                    
                    for character in language.characters{
                        print(character.name)
                    }
                    
                    for game in language.games{
                        print(game.name)
                    }
                    
                    for story in language.stories{
                        print(story.name)
                    }
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
