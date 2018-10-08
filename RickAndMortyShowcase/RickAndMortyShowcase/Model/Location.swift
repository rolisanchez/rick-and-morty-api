//
//  Location.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 7/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

class Location: NSObject, NSCoding {
    let id: String
    let name: String
    let type: String
    let dimension: String
    let url: URL
    
    init(id: String, name: String, type: String, dimension: String, url: URL) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.url = url
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "locationId")
        aCoder.encode(self.name, forKey: "locationName")
        aCoder.encode(self.type, forKey: "locationType")
        aCoder.encode(self.dimension, forKey: "locationDimension")
        aCoder.encode(self.url, forKey: "locationURL")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedId = aDecoder.decodeObject(forKey: "locationId") as? String
        let storedName = aDecoder.decodeObject(forKey: "locationName") as? String
        let storedType = aDecoder.decodeObject(forKey: "locationType") as? String
        let storedDimension = aDecoder.decodeObject(forKey: "locationDimension") as? String
        let storedURL = aDecoder.decodeObject(forKey: "locationURL") as? URL
        
        self.init(id: storedId!, name: storedName!, type: storedType!, dimension: storedDimension!, url: storedURL!)
    }
    
}
