//
//  Helpers.swift
//  RickAndMortyShowcase
//
//  Created by Victor Rolando Sanchez Jara on 8/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import Foundation

class Helpers {
    
    static func characterListPath() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = paths[0].appendingPathComponent("characterListFile.plist")
        return filePath.path
    }
    
    static func episodeListPath() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = paths[0].appendingPathComponent("episodeListFile.plist")
        return filePath.path
    }
    
    static func locationListPath() -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let filePath = paths[0].appendingPathComponent("locationListFile.plist")
        return filePath.path
    }
    
    static func fixJsonData (data: Data) -> Data {
        var dataString = String(data: data, encoding: String.Encoding.utf8)
        dataString = dataString?.replacingOccurrences(of: "\\'", with: "'")
        return (dataString?.data(using: String.Encoding.utf8))!
    }
}

