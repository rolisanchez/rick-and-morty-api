//
//  Character.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 7/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

class Character: NSObject, NSCoding {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let originName: String
//    let originURL: URL
    let locationName: String
//    let locationURL: URL
    let imageURL: URL
    let url: URL
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, originName: String, locationName: String, imageURL: URL, url: URL) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.originName = originName
        self.locationName = locationName
        self.imageURL = imageURL
        self.url = url
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "characterId")
        aCoder.encode(self.name, forKey: "characterName")
        aCoder.encode(self.status, forKey: "characterStatus")
        aCoder.encode(self.species, forKey: "characterSpecies")
        aCoder.encode(self.type, forKey: "characterType")
        aCoder.encode(self.gender, forKey: "characterGender")
        aCoder.encode(self.originName, forKey: "characterOriginName")
        aCoder.encode(self.locationName, forKey: "characterLocationName")
        aCoder.encode(self.imageURL, forKey: "characterImageURL")
        aCoder.encode(self.url, forKey: "characterURL")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedId = aDecoder.decodeObject(forKey: "characterId") as? Int
        let storedName = aDecoder.decodeObject(forKey: "characterName") as? String
        let storedStatus = aDecoder.decodeObject(forKey: "characterStatus") as? String
        let storedSpecies = aDecoder.decodeObject(forKey: "characterSpecies") as? String
        let storedType = aDecoder.decodeObject(forKey: "characterType") as? String
        let storedGender = aDecoder.decodeObject(forKey: "characterGender") as? String
        let storedOriginName = aDecoder.decodeObject(forKey: "characterOriginName") as? String
        let storedLocationName = aDecoder.decodeObject(forKey: "characterLocationName") as? String
        let storedImageURL = aDecoder.decodeObject(forKey: "characterImageURL") as? URL
        let storedURL = aDecoder.decodeObject(forKey: "characterURL") as? URL
        
        self.init(id: storedId!, name: storedName!, status: storedStatus!, species: storedSpecies!, type: storedType!, gender: storedGender!, originName: storedOriginName!, locationName: storedLocationName!, imageURL: storedImageURL!, url: storedURL!)
    }
}
