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
    var age: String
    var email: String
    
    var strengthWorkout: Bool
    var hypertrophyWorkout: Bool
    
    var bbBenchWeight: Int
    var shoulderPressWeight: Int
    var rowWeight: Int
    var dbInclineWeight: Int
    
    var dbCurlWeight: Int
    var hCurlWeight: Int
    var skullCrusherWeight: Int
    var tricepPDownWeight: Int
    
    var squatWeight: Int
    var rdlWeight: Int
    var fSquatWeight: Int
    var deadLiftWeight: Int
    var hexBarWeight: Int
    var dbLungeWeight: Int
    
    static var archiveURL: URL {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentURL.appendingPathComponent("profiles").appendingPathExtension("plist")
        
        return archiveURL
    }
    //Create default profiles for testing
    static var startingProfiles: [Profile] {
        return [
            Profile(username: "bcsehoski", password: "bricse123!", firstName: "Brian", lastName: "Csehoski", age: "20", email: "csehoskibrian0@gmail.com", strengthWorkout: true, hypertrophyWorkout: false, bbBenchWeight: 125, shoulderPressWeight: 95, rowWeight: 135, dbInclineWeight: 50, dbCurlWeight: 40, hCurlWeight: 50, skullCrusherWeight: 95, tricepPDownWeight: 40, squatWeight: 225, rdlWeight: 185, fSquatWeight: 205, deadLiftWeight: 275, hexBarWeight: 275, dbLungeWeight: 50),
            Profile(username: "dufua", password: "danufu123!", firstName: "Daniel", lastName: "Ufua", age: "20", email: "daniel.ufua@my.amptonu.edu", strengthWorkout: false, hypertrophyWorkout: true, bbBenchWeight: 125, shoulderPressWeight: 95, rowWeight: 135, dbInclineWeight: 50, dbCurlWeight: 40, hCurlWeight: 50, skullCrusherWeight: 95, tricepPDownWeight: 40, squatWeight: 225, rdlWeight: 185, fSquatWeight: 205, deadLiftWeight: 275, hexBarWeight: 275, dbLungeWeight: 50)
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
            print("profile loaded ")
            return decodedProfiles
        } catch {
            print("Error decoding profiles: \(error)")
            return nil
        }
    }
}
