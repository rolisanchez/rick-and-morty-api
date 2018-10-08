//
//  CharacterList.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 7/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation




func fixJsonData (data: Data) -> Data {
    var dataString = String(data: data, encoding: String.Encoding.utf8)
    dataString = dataString?.replacingOccurrences(of: "\\'", with: "'")
    return (dataString?.data(using: String.Encoding.utf8))!
}


class CharacterList: NSObject, NSCoding {
    let characterList: [Character]

    init(characterList newCharacterList: [Character]) {
        self.characterList = newCharacterList
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.characterList, forKey: "characteList")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedCharacterList = aDecoder.decodeObject(forKey: "characterList") as? [Character]
        
        guard storedCharacterList != nil else {
            print("could not decode stored characters")
            return nil
        }
        self.init(characterList: storedCharacterList!)
    }
    
    convenience init?(data: Data) {
        var newCharacterList = [Character]()
        
        let fixedData = fixJsonData(data: data)
        var jsonObject: Dictionary<String, AnyObject>?
        
        do {
            jsonObject = try JSONSerialization.jsonObject(with: fixedData, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? Dictionary<String,AnyObject>
        } catch  {
            print("error when serializing JSON")
        }
        
        guard let listRoot = jsonObject else {
            return nil
        }
        
        guard let characters = listRoot["results"] as? Array<AnyObject>  else {
            return nil
        }
        
        for character in characters {
            
            guard let characterDict = character as? Dictionary<String,AnyObject> else {
                continue
            }
            
            guard let id = characterDict["id"] as? Int else {
                print("failed getting id")
                continue
            }
            
            guard let name = characterDict["name"] as? String else {
                print("failed getting name")
                continue
            }
            
            guard let status = characterDict["status"] as? String else {
                print("failed getting status")
                continue
            }
            
            guard let species = characterDict["species"] as? String else {
                print("failed getting species")
                continue
            }
            
            guard let type = characterDict["type"] as? String else {
                print("failed getting type")
                continue
            }
            
            guard let gender = characterDict["gender"] as? String else {
                print("failed getting gender")
                continue
            }
            
            guard let originName = characterDict["origin"]!["name"] as? String else {
                print("failed getting originName")
                continue
            }
                        
            guard let locationName = characterDict["location"]!["name"] as? String else {
                print("failed getting locationName")
                continue
            }
            
            guard let imageURLString = characterDict["image"] as? String else{
                print("failed getting imageURLString")
                continue
            }
            
            guard let imageURL = URL(string: imageURLString) else {
                print("failed getting imageURL")
                continue
            }
            
            guard let urlString = characterDict["url"] as? String else  {
                print("failed getting urlString")
                continue
            }
            
            guard let url = URL(string: urlString) else {
                print("failed getting url")
                continue
            }
            
            
            newCharacterList.append(Character(id: id, name: name, status: status, species: species, type: type, gender: gender, originName: originName, locationName: locationName, imageURL: imageURL, url: url))
        }
        
        print("charactersList \(newCharacterList.count)")
        self.init(characterList: newCharacterList)
    }
}
