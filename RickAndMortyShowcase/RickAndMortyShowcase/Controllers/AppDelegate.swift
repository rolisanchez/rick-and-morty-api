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
        AppSettings.episodesApiURL = "https://rickandmortyapi.com/api/location"
        AppSettings.locationsApiURL = "https://rickandmortyapi.com/api/episode"

        return true
    }


    func applicationDidBecomeActive(_ application: UIApplication) {
        self.checkLastUpdateOrUpdateInfo()
    }

    func checkLastUpdateOrUpdateInfo() {
        let lastUpdatedSetting = AppSettings.lastUpdate as? Date
        print("lastUpdatedSetting \(lastUpdatedSetting)")
        
        var shouldUpdate = true
        
        // Time interval is in seconds, so 20 minutes * 60 seconds
        if let lastUpdated = lastUpdatedSetting, (Date().timeIntervalSince(lastUpdated) < 20.0*60.0) {
            shouldUpdate = false
        }
        shouldUpdate = true
        if shouldUpdate {
            self.updateInfo()
        }
        else {
            print("Didn't need to update")
        }
        
    }
    
    func updateInfo() {
        let charactersApiURLString = AppSettings.charactersApiURL
        print("charactersApiURL \(charactersApiURLString)")
        let episodesApiURLString = AppSettings.episodesApiURL
        print("episodesApiURLString \(episodesApiURLString)")
        let locationsApiURLString = AppSettings.locationsApiURL
        print("locationsApiURLString \(locationsApiURLString)")
        
        guard let charactersApiURL = URL(string: charactersApiURLString!) else {
            print("characters api url string not found")
            return
        }
        
        guard let episodesApiURL = URL(string: episodesApiURLString!) else {
            print("episodes api url string not found")
            return
        }
        
        guard let locationsApiURL = URL(string: episodesApiURLString!) else {
            print("locations api url string not found")
            return
        }
        
        let charactersRequest = URLRequest(url: charactersApiURL)
        let episodesRequest = URLRequest(url: episodesApiURL)
        let locationsRequest = URLRequest(url: locationsApiURL)
        
        let charactersTask = URLSession.shared.dataTask(with: charactersRequest) {(data, response, error) -> Void in
            if error == nil && data != nil {
                let characterList = CharacterList(data: data!)
                
                if let goodCharacterList = characterList {
                    if self.saveCharacterList(characterList: goodCharacterList) {
                        AppSettings.lastUpdate = Date()
                    }
                }
                
                print("Loaded remote characters")
            }
        }
        
        charactersTask.resume()
    }
    
    func characterListPath() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = paths[0].appendingPathComponent("characterListFile.plist")
        return filePath.path
    }
    
    func saveCharacterList(characterList: CharacterList) -> Bool {
        let success = NSKeyedArchiver.archiveRootObject(characterList, toFile: characterListPath())
        assert(success, "failed to write characterList archive")
        return success
    }
}

