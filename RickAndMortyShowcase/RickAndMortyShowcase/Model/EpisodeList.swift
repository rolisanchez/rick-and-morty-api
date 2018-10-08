//
//  EpisodeList.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

class EpisodeList: NSObject, NSCoding {
    let episodes: [Episode]
    
    init(episodes newEpisodes: [Episode]) {
        self.episodes = newEpisodes
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.episodes, forKey: "episodes")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedEpisodes = aDecoder.decodeObject(forKey: "episodes") as? [Episode]
        
        guard storedEpisodes != nil else {
            print("could not decode stored episodes")
            return nil
        }
        self.init(episodes: storedEpisodes!)
    }
    
    convenience init?(data: Data) {
        var newEpisodes = [Episode]()
        
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
        
        guard let episodes = listRoot["results"] as? Array<AnyObject>  else {
            return nil
        }
        
        for episode in episodes {
            guard let episodeDict = episode as? Dictionary<String,AnyObject> else {
                continue
            }
            
            guard let id = episodeDict["id"] as? Int else {
                print("failed getting id - episodes")
                continue
            }
            
            guard let name = episodeDict["name"] as? String else {
                print("failed getting name - episodes")
                continue
            }
            
            guard let airDate = episodeDict["air_date"] as? String else {
                print("failed getting airDate - episodes")
                continue
            }
            
            guard let episode = episodeDict["episode"] as? String else {
                print("failed getting episode - episodes")
                continue
            }
            
            guard let urlString = episodeDict["url"] as? String else  {
                print("failed getting urlString - episodes")
                continue
            }
            
            guard let url = URL(string: urlString) else {
                print("failed getting url - episodes")
                continue
            }
            
            newEpisodes.append(Episode(id: "\(id)", name: name, airDate: airDate, episode: episode, url: url))
        }
        
        print("episodes count \(newEpisodes.count)")
        self.init(episodes: newEpisodes)
    }
}
