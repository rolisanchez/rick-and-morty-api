//
//  AppDelegate.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 6/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppSettings.charactersApiURL = "https://rickandmortyapi.com/api/character"
        AppSettings.episodesApiURL = "https://rickandmortyapi.com/api/episode"
        AppSettings.locationsApiURL = "https://rickandmortyapi.com/api/location"

        return true
    }


    func applicationDidBecomeActive(_ application: UIApplication) {
        self.checkLastUpdateOrUpdateCharacters()
        self.checkLastUpdateOrUpdateEpisodes()
        self.checkLastUpdateOrUpdateLocations()
    }

    func checkLastUpdateOrUpdateCharacters() {
        let lastUpdatedSetting = AppSettings.lastUpdateCharacters
        print("lastUpdatedSetting Characters \(lastUpdatedSetting)")
        
        var shouldUpdate = true
        
        // Time interval is in seconds, so 20 minutes * 60 seconds
        if let lastUpdated = lastUpdatedSetting, (Date().timeIntervalSince(lastUpdated) < 20.0*60.0) {
            shouldUpdate = false
        }
        if shouldUpdate {
            self.updateCharacters()
        }
        else {
            print("Didn't need to update characters")
        }
        
    }
    
    func checkLastUpdateOrUpdateEpisodes() {
        let lastUpdatedSetting = AppSettings.lastUpdateEpisodes
        print("lastUpdatedSetting Episodes \(lastUpdatedSetting)")
        
        var shouldUpdate = true
        
        // Time interval is in seconds, so 20 minutes * 60 seconds
        if let lastUpdated = lastUpdatedSetting, (Date().timeIntervalSince(lastUpdated) < 20.0*60.0) {
            shouldUpdate = false
        }
        if shouldUpdate {
            self.updateEpisodes()
        }
        else {
            print("Didn't need to update episodes")
        }
        
    }
    
    func checkLastUpdateOrUpdateLocations() {
        let lastUpdatedSetting = AppSettings.lastUpdateLocations
        
        var shouldUpdate = true
        
        // Time interval is in seconds, so 20 minutes * 60 seconds
        if let lastUpdated = lastUpdatedSetting, (Date().timeIntervalSince(lastUpdated) < 20.0*60.0) {
            shouldUpdate = false
        }
        if shouldUpdate {
            self.updateLocations()
        }
        else {
            print("Didn't need to update locations")
        }
        
    }
    
    func updateCharacters() {
        let charactersApiURLString = AppSettings.charactersApiURL
        
        guard let charactersApiURL = URL(string: charactersApiURLString!) else {
            print("characters api url string not found")
            return
        }
        
        let charactersRequest = URLRequest(url: charactersApiURL)
        
        let charactersTask = URLSession.shared.dataTask(with: charactersRequest) {(data, response, error) -> Void in
            if error == nil && data != nil {
                let characterList = CharacterList(data: data!)
                
                if let goodCharacterList = characterList {
                    if self.saveCharacterList(characterList: goodCharacterList) {
                        AppSettings.lastUpdateCharacters = Date()
                    }
                }
                
                print("Loaded remote characters")
            }
        }
        
        charactersTask.resume()
        
    }
    
    func updateEpisodes() {
        let episodesApiURLString = AppSettings.episodesApiURL
        
        guard let episodesApiURL = URL(string: episodesApiURLString!) else {
            print("episodes api url string not found")
            return
        }
        
        let episodesRequest = URLRequest(url: episodesApiURL)
        
        let episodesTask = URLSession.shared.dataTask(with: episodesRequest) {(data, response, error) -> Void in
            if error == nil && data != nil {
                let episodeList = EpisodeList(data: data!)
                
                if let goodEpisodeList = episodeList {
                    if self.saveEpisodeList(episodeList: goodEpisodeList) {
                        AppSettings.lastUpdateEpisodes = Date()
                    }
                }
                
                print("Loaded remote episodes")
            }
        }
        
        episodesTask.resume()
    }
    
    func updateLocations() {
        let locationsApiURLString = AppSettings.locationsApiURL

        guard let locationsApiURL = URL(string: locationsApiURLString!) else {
            print("locations api url string not found")
            return
        }

        let locationsRequest = URLRequest(url: locationsApiURL)
        
//        let locationsTask = URLSession.shared.dataTask(with: episodesRequest) {(data, response, error) -> Void in
//            if error == nil && data != nil {
//                let locationList = LocationList(data: data!)
//
//                if let goodLocationList = locationList {
//                    if self.saveLocationList(locationList: goodLocationList) {
//                        AppSettings.lastUpdateLocations = Date()
//                    }
//                }
//
//                print("Loaded remote locations")
//            }
//        }
//
//        locationsTask.resume()
    }
    

    func saveCharacterList(characterList: CharacterList) -> Bool {
        let success = NSKeyedArchiver.archiveRootObject(characterList, toFile: Helpers.characterListPath())
        assert(success, "failed to write characterList archive")
        return success
    }
    
    func saveEpisodeList(episodeList: EpisodeList) -> Bool {
        let success = NSKeyedArchiver.archiveRootObject(episodeList, toFile: Helpers.episodeListPath())
        assert(success, "failed to write episodeList archive")
        return success
    }
    
    func saveLocationList(locationList: LocationList) -> Bool {
        let success = NSKeyedArchiver.archiveRootObject(locationList, toFile: Helpers.locationListPath())
        assert(success, "failed to write locationList archive")
        return success
    }
}

