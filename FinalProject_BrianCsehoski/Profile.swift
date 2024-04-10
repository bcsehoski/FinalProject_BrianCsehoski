//
//  Profile.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 4/10/24.
//

import Foundation

struct Profile: Codable {
    var username: String
    var password: String
    var firstName: String
    var lastName: String
    var age: Int
    var email: String
    var firstTime: Bool
    
    static var archiveURL: URL {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentURL.appendingPathComponent("profiles").appendingPathExtension("plist")
        
        return archiveURL
    }
    //Create default profiles for testing
    static var startingProfiles: [Profile] {
        return [
            Profile(username: "bcsehoski", password: "bricse123!", firstName: "Brian", lastName: "Csehoski", age: 20, email: "csehoskibrian0@gmail.com", firstTime: true),
            Profile(username: "dufua", password: "danufu123!", firstName: "Daniel", lastName: "Ufua", age: 20, email: "daniel.ufua@my.amptonu.edu", firstTime: true)
        ]
    }
    
    //Save profiles to file
    static func saveToFile(profiles: [Profile]) {
        let encoder = PropertyListEncoder()
        do {
            let encodedProfiles = try encoder.encode(profiles)
            try encodedProfiles.write(to: Profile.archiveURL)
        } catch {
            print("Error encoding profiles: \(error)")
        }
    }
    
    static func loadFromFile() -> [Profile]? {
        guard let profileData = try? Data(contentsOf: Profile.archiveURL) else {
            return nil
        }
        
        do {
            let decoder = PropertyListDecoder()
            let decodedProfiles = try decoder.decode([Profile].self, from: profileData)
            return decodedProfiles
        } catch {
            print("Error decoding profiles: \(error)")
            return nil
        }
    }
}
