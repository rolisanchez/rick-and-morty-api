//
//  LocationList.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

class LocationList: NSObject, NSCoding {
    let locations: [Location]
    
    init(locations newLocations: [Location]) {
        self.locations = newLocations
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.locations, forKey: "locations")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedLocations = aDecoder.decodeObject(forKey: "locations") as? [Location]
        
        guard storedLocations != nil else {
            print("could not decode stored locations")
            return nil
        }
        self.init(locations: storedLocations!)
    }
    
    convenience init?(data: Data) {
        var newLocations = [Location]()
        
        let fixedData = Helpers.fixJsonData(data: data)
        var jsonObject: Dictionary<String, AnyObject>?
        
        do {
            jsonObject = try JSONSerialization.jsonObject(with: fixedData, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? Dictionary<String,AnyObject>
        } catch  {
            print("error when serializing JSON")
        }
        
        guard let listRoot = jsonObject else {
            return nil
        }
        
        guard let locations = listRoot["results"] as? Array<AnyObject>  else {
            return nil
        }
        
        for location in locations {
            guard let locationDict = location as? Dictionary<String,AnyObject> else {
                continue
            }
            
            guard let id = locationDict["id"] as? Int else {
                print("failed getting id - locations")
                continue
            }
            
            guard let name = locationDict["name"] as? String else {
                print("failed getting name - locations")
                continue
            }
            
            guard let type = locationDict["type"] as? String else {
                print("failed getting type - locations")
                continue
            }
            
            guard let dimension = locationDict["dimension"] as? String else {
                print("failed getting dimension - locations")
                continue
            }
            
            guard let urlString = locationDict["url"] as? String else  {
                print("failed getting urlString - locations")
                continue
            }
            
            guard let url = URL(string: urlString) else {
                print("failed getting url - locations")
                continue
            }
            
            newLocations.append(Location(id: "\(id)", name: name, type: type, dimension: dimension, url: url))
        }
        
        print("locations count \(newLocations.count)")
        self.init(locations: newLocations)
    }
    
}
