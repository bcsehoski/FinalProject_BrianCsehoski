//
//  ViewController.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 3/27/24.
//

import UIKit

class LoginPage: UIViewController {
    @IBOutlet weak var mainStackView: UIStackView!
    
    @IBOutlet weak var passwordEntry: UITextField!
    @IBOutlet weak var usernameEntry: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var noAccountButton: UIButton!
    
    
    var profiles: [Profile] = [] {
        didSet {
            Profile.saveToFile(profiles: profiles)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let savedProfiles = Profile.loadFromFile() {
            profiles = savedProfiles
        } else {
            profiles = Profile.startingProfiles
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let landingVC = segue.destination as? TabBarSubclass else { return }
        let currentProfile = getProfileFromUsername(username: usernameEntry.text!)
        landingVC.profile = currentProfile
        
    }
    

    @IBAction func segueDecider(_ sender: Any) {
        let currentProfile = getProfileFromUsername(username: usernameEntry.text!)
        if currentProfile.username != "" {
            if currentProfile.password == passwordEntry.text {
                performSegue(withIdentifier: "success", sender: nil)
            } else {
                print("Wrong password")
            }
        } else {
            print("No such profile")
        }
        
    }
    
    
    func getProfileFromUsername(username: String) -> Profile {
        for profile in profiles {
            if profile.username == username {
                return profile
            }
        }
        return Profile(username: "", password: "", firstName: "", lastName: "", age: "", email: "", strengthWorkout: false, hypertrophyWorkout: false, bbBenchWeight: 125, shoulderPressWeight: 95, rowWeight: 135, dbInclineWeight: 50, dbCurlWeight: 40, hCurlWeight: 50, skullCrusherWeight: 95, tricepPDownWeight: 40, squatWeight: 225, rdlWeight: 185, fSquatWeight: 205, deadLiftWeight: 275, hexBarWeight: 275, dbLungeWeight: 50)
    }
    
    @IBSegueAction func createAccount(_ coder: NSCoder, sender: Any?) -> CreateAccount? {
        return CreateAccount(coder: coder, profile: nil)
    }
    
    @IBAction func unwindCreateAccount(_ seg: UIStoryboardSegue) {
        guard seg.identifier == "createAccountUnwind",
              let sourceViewController = seg.source as? CreateAccount,
              let profile = sourceViewController.profile else {return}
        profiles.append(profile)
    }
    
}

