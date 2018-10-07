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
    let originURL: URL
    let locationName: String
    let locationURL: URL
    let imageURL: URL
    let episodeURL: URL
    let url: URL
    let created: Date
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, originName: String, originURL: URL, locationName: String, locationURL: URL, imageURL: URL, episodeURL: URL, url: URL, created: Date) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.originName = originName
        self.originURL = originURL
        self.locationName = locationName
        self.locationURL = locationURL
        self.imageURL = imageURL
        self.episodeURL = episodeURL
        self.url = url
        self.created = created
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "characterId")
        aCoder.encode(self.name, forKey: "characterName")
        aCoder.encode(self.status, forKey: "characterStatus")
        aCoder.encode(self.species, forKey: "characterSpecies")
        aCoder.encode(self.type, forKey: "characterType")
        aCoder.encode(self.gender, forKey: "characterGender")
        aCoder.encode(self.originName, forKey: "characterOriginName")
        aCoder.encode(self.originURL, forKey: "characterOriginURL")
        aCoder.encode(self.locationName, forKey: "characterLocationName")
        aCoder.encode(self.locationURL, forKey: "characterLocationURL")
        aCoder.encode(self.imageURL, forKey: "characterImageURL")
        aCoder.encode(self.episodeURL, forKey: "characterEpisodeURL")
        aCoder.encode(self.url, forKey: "characterURL")
        aCoder.encode(self.created, forKey: "characterCreated")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedId = aDecoder.decodeObject(forKey: "characterId") as? Int
        let storedName = aDecoder.decodeObject(forKey: "characterName") as? String
        let storedStatus = aDecoder.decodeObject(forKey: "characterStatus") as? String
        let storedSpecies = aDecoder.decodeObject(forKey: "characterSpecies") as? String
        let storedType = aDecoder.decodeObject(forKey: "characterType") as? String
        let storedGender = aDecoder.decodeObject(forKey: "characterGender") as? String
        let storedOriginName = aDecoder.decodeObject(forKey: "characterOriginName") as? String
        let storedOriginURL = aDecoder.decodeObject(forKey: "characterOriginURL") as? URL
        let storedLocationName = aDecoder.decodeObject(forKey: "characterLocationName") as? String
        let storedLocationURL = aDecoder.decodeObject(forKey: "characterLocationURL") as? URL
        let storedImageURL = aDecoder.decodeObject(forKey: "characterImageURL") as? URL
        let storedEpisodeURL = aDecoder.decodeObject(forKey: "characterEpisodeURL") as? URL
        let storedURL = aDecoder.decodeObject(forKey: "characterURL") as? URL
        let storedCreated = aDecoder.decodeObject(forKey: "characterCreated") as? Date
        
        self.init(id: storedId!, name: storedName!, status: storedStatus!, species: storedSpecies!, type: storedType!, gender: storedGender!, originName: storedOriginName!, originURL: storedOriginURL!, locationName: storedLocationName!, locationURL: storedLocationURL!, imageURL: storedImageURL!, episodeURL: storedEpisodeURL!, url: storedURL!, created: storedCreated!)
    }
}
