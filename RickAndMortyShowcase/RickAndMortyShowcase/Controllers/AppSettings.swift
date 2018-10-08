//
//  AppSettings.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 7/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

final class AppSettings {
    
    private enum SettingKey: String {
        case charactersApiURL
        case episodesApiURL
        case locationsApiURL
        case lastUpdateCharacters
        case lastUpdateEpisodes
        case lastUpdateLocations
    }
    
    static var charactersApiURL: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingKey.charactersApiURL.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.charactersApiURL.rawValue
            
            if let apiUrl = newValue {
                defaults.set(apiUrl, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var episodesApiURL: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingKey.episodesApiURL.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.episodesApiURL.rawValue
            
            if let apiUrl = newValue {
                defaults.set(apiUrl, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var locationsApiURL: String! {
        get {
            return UserDefaults.standard.string(forKey: SettingKey.locationsApiURL.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.locationsApiURL.rawValue
            
            if let apiUrl = newValue {
                defaults.set(apiUrl, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var lastUpdateCharacters: Date? {
        get {
            return UserDefaults.standard.object(forKey: SettingKey.lastUpdateCharacters.rawValue) as? Date
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.lastUpdateCharacters.rawValue
            
            if let lastUpdateCharacters = newValue {
                defaults.set(lastUpdateCharacters, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var lastUpdateEpisodes: Date? {
        get {
            return UserDefaults.standard.object(forKey: SettingKey.lastUpdateEpisodes.rawValue) as? Date
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.lastUpdateEpisodes.rawValue
            
            if let lastUpdateEpisodes = newValue {
                defaults.set(lastUpdateEpisodes, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var lastUpdateLocations: Date? {
        get {
            return UserDefaults.standard.object(forKey: SettingKey.lastUpdateLocations.rawValue) as? Date
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.lastUpdateLocations.rawValue
            
            if let lastUpdateLocations = newValue {
                defaults.set(lastUpdateLocations, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
}
