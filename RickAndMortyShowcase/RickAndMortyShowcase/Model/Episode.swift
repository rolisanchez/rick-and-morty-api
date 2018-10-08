//
//  Episode.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 7/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

class Episode: NSObject, NSCoding {
    let id: String
    let name: String
    let airDate: String
    let episode: String
    let url: URL
    
    init(id: String, name: String, airDate: String, episode: String, url: URL) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.url = url
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "episodeId")
        aCoder.encode(self.name, forKey: "episodeName")
        aCoder.encode(self.airDate, forKey: "episodeAirDate")
        aCoder.encode(self.episode, forKey: "episodeEpisode")
        aCoder.encode(self.url, forKey: "episodeURL")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let storedId = aDecoder.decodeObject(forKey: "episodeId") as? String
        let storedName = aDecoder.decodeObject(forKey: "episodeName") as? String
        let storedAirDate = aDecoder.decodeObject(forKey: "episodeAirDate") as? String
        let storedEpisode = aDecoder.decodeObject(forKey: "episodeEpisode") as? String
        let storedURL = aDecoder.decodeObject(forKey: "episodeURL") as? URL
        
        self.init(id: storedId!, name: storedName!, airDate: storedAirDate!, episode: storedEpisode!, url: storedURL!)
    }
    
}
