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
        case lastUpdate
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
    
    static var lastUpdate: Date? {
        get {
            return UserDefaults.standard.object(forKey: SettingKey.lastUpdate.rawValue) as? Date
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKey.lastUpdate.rawValue
            
            if let lastUpdate = newValue {
                defaults.set(lastUpdate, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
}
