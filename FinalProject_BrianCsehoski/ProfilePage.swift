//
//  ProfilePage.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 4/30/24.
//

import UIKit

class ProfilePage: UIViewController {
    
    var profile: Profile?
    
    var profiles: [Profile] = [] {
        didSet {
            Profile.saveToFile(profiles: profiles)
        }
    }
    
    
    @IBOutlet weak var fNameLabel: UILabel!
    @IBOutlet weak var lNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var hypertrophyLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var benchLabel: UILabel!
    @IBOutlet weak var sPressLabel: UILabel!
    @IBOutlet weak var rowLabel: UILabel!
    @IBOutlet weak var dbInclineLabel: UILabel!
    @IBOutlet weak var dbCurlLabel: UILabel!
    @IBOutlet weak var hCurlLabel: UILabel!
    @IBOutlet weak var sCrusherLabel: UILabel!
    @IBOutlet weak var tPushDownLabel: UILabel!
    @IBOutlet weak var squatLabel: UILabel!
    @IBOutlet weak var rdlLabel: UILabel!
    @IBOutlet weak var fSquatLabel: UILabel!
    @IBOutlet weak var deadliftLabel: UILabel!
    @IBOutlet weak var hexDeadliftLabel: UILabel!
    @IBOutlet weak var dbLungeLabel: UILabel!
    
    @IBOutlet weak var benchWeightUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tbc = tabBarController as? TabBarSubclass {
            profile = tbc.profile
            guard let profile = tbc.profile else { return }
            if let savedProfiles = Profile.loadFromFile() {
                profiles = savedProfiles
            } else {
                profiles = Profile.startingProfiles
            }
            let currentProfileUsername = profile.username
            var currentProfileIndex = 0
            for i in 0...profiles.count - 1 {
                if profiles[i].username == currentProfileUsername {
                    currentProfileIndex = i
                }
            }
            let currentProfile = profiles[currentProfileIndex]
            fNameLabel.text = currentProfile.firstName
            lNameLabel.text = currentProfile.lastName
            ageLabel.text = currentProfile.age
            emailLabel.text = currentProfile.email
            if currentProfile.hypertrophyWorkout == true {
                hypertrophyLabel.text = "Yes"
                strengthLabel.text = "No"
            } else if currentProfile.strengthWorkout == true {
                hypertrophyLabel.text = "No"
                strengthLabel.text = "Yes"
            }
            benchLabel.text = String(currentProfile.bbBenchWeight)
            sPressLabel.text = String(currentProfile.shoulderPressWeight)
            rowLabel.text = String(currentProfile.rowWeight)
            dbInclineLabel.text = String(currentProfile.dbInclineWeight)
            dbCurlLabel.text = String(currentProfile.dbCurlWeight)
            hCurlLabel.text = String(currentProfile.hCurlWeight)
            sCrusherLabel.text = String(currentProfile.skullCrusherWeight)
            tPushDownLabel.text = String(currentProfile.tricepPDownWeight)
            squatLabel.text = String(currentProfile.squatWeight)
            rdlLabel.text = String(currentProfile.rdlWeight)
            fSquatLabel.text = String(currentProfile.fSquatWeight)
            deadliftLabel.text = String(currentProfile.deadLiftWeight)
            hexDeadliftLabel.text = String(currentProfile.hexBarWeight)
            dbLungeLabel.text = String(currentProfile.dbLungeWeight)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tbc = tabBarController as? TabBarSubclass {
            profile = tbc.profile
            guard let profile = tbc.profile else { return }
            if let savedProfiles = Profile.loadFromFile() {
                profiles = savedProfiles
            } else {
                profiles = Profile.startingProfiles
            }
            let currentProfileUsername = profile.username
            var currentProfileIndex = 0
            for i in 0...profiles.count - 1 {
                if profiles[i].username == currentProfileUsername {
                    currentProfileIndex = i
                }
            }
            let currentProfile = profiles[currentProfileIndex]
            fNameLabel.text = currentProfile.firstName
            lNameLabel.text = currentProfile.lastName
            ageLabel.text = currentProfile.age
            emailLabel.text = currentProfile.email
            if currentProfile.hypertrophyWorkout == true {
                hypertrophyLabel.text = "Yes"
                strengthLabel.text = "No"
            } else if currentProfile.strengthWorkout == true {
                hypertrophyLabel.text = "No"
                strengthLabel.text = "Yes"
            }
            benchLabel.text = String(currentProfile.bbBenchWeight)
            sPressLabel.text = String(currentProfile.shoulderPressWeight)
            rowLabel.text = String(currentProfile.rowWeight)
            dbInclineLabel.text = String(currentProfile.dbInclineWeight)
            dbCurlLabel.text = String(currentProfile.dbCurlWeight)
            hCurlLabel.text = String(currentProfile.hCurlWeight)
            sCrusherLabel.text = String(currentProfile.skullCrusherWeight)
            tPushDownLabel.text = String(currentProfile.tricepPDownWeight)
            squatLabel.text = String(currentProfile.squatWeight)
            rdlLabel.text = String(currentProfile.rdlWeight)
            fSquatLabel.text = String(currentProfile.fSquatWeight)
            deadliftLabel.text = String(currentProfile.deadLiftWeight)
            hexDeadliftLabel.text = String(currentProfile.hexBarWeight)
            dbLungeLabel.text = String(currentProfile.dbLungeWeight)
        }
    }
    @IBAction func submitWeightChanges(_ sender: Any) {
        
        let benchWeight = Int(benchLabel.text ?? "")
        let sPressWeight = Int(sPressLabel.text ?? "")
        let rWeight = Int(rowLabel.text ?? "")
        let DBInclineWeight = Int(dbInclineLabel.text ?? "")
        let DBCurlWeight = Int(dbCurlLabel.text ?? "")
        let HCurlWeight = Int(hCurlLabel.text ?? "")
        let sCrusherWeight = Int(sCrusherLabel.text ?? "")
        let tPushDownWeight = Int(tPushDownLabel.text ?? "")
        let SquatWeight = Int(squatLabel.text ?? "")
        let RDLWeight = Int(rdlLabel.text ?? "")
        let FSquatWeight = Int(fSquatLabel.text ?? "")
        let DeadliftWeight = Int(deadliftLabel.text ?? "")
        let hexDeadLiftWeight = Int(hexDeadliftLabel.text ?? "")
        let DBLungeWeight = Int(dbLungeLabel.text ?? "")
        
        profile?.bbBenchWeight = benchWeight!
        profile?.shoulderPressWeight = sPressWeight!
        profile?.rowWeight = rWeight!
        profile?.dbInclineWeight = DBInclineWeight!
        profile?.dbCurlWeight = DBCurlWeight!
        profile?.hCurlWeight = HCurlWeight!
        profile?.skullCrusherWeight = sCrusherWeight!
        profile?.tricepPDownWeight = tPushDownWeight!
        profile?.squatWeight = SquatWeight!
        profile?.rdlWeight = RDLWeight!
        profile?.fSquatWeight = FSquatWeight!
        profile?.deadLiftWeight = DeadliftWeight!
        profile?.hexBarWeight = hexDeadLiftWeight!
        profile?.dbLungeWeight = DBLungeWeight!
        
        
        let currentProfileUsername = profile?.username
        
        var currentProfileIndex = 0
        for i in 0...profiles.count - 1 {
            if profiles[i].username == currentProfileUsername {
                currentProfileIndex = i
            }
        }
        
        print(profile)
        
        profiles[currentProfileIndex] = profile!
    }
    @IBAction func benchWeightUp(_ sender: Any) {
        let currentBenchWeight = Int(benchLabel.text ?? "")
        let newBenchWeight = currentBenchWeight! + 5
        benchLabel.text = String(newBenchWeight)
    }
    @IBAction func benchWeightDown(_ sender: Any) {
        let currentBenchWeight = Int(benchLabel.text ?? "")
        let newBenchWeight = currentBenchWeight! - 5
        benchLabel.text = String(newBenchWeight)
    }
    @IBAction func sPressWeightUp(_ sender: Any) {
        let currentSPressWeight = Int(sPressLabel.text ?? "")
        let newSPressWeight = currentSPressWeight! + 5
        sPressLabel.text = String(newSPressWeight)
    }
    @IBAction func sPressWeightDown(_ sender: Any) {
        let currentSPressWeight = Int(sPressLabel.text ?? "")
        let newSPressWeight = currentSPressWeight! - 5
        sPressLabel.text = String(newSPressWeight)
    }
    @IBAction func rowWeightUp(_ sender: Any) {
        let currentRowWeight = Int(rowLabel.text ?? "")
        let newRowWeight = currentRowWeight! + 5
        rowLabel.text = String(newRowWeight)
    }
    @IBAction func rowWeightDown(_ sender: Any) {
        let currentRowWeight = Int(rowLabel.text ?? "")
        let newRowWeight = currentRowWeight! - 5
        rowLabel.text = String(newRowWeight)
    }
    @IBAction func dbInclineWeightUp(_ sender: Any) {
        let currentDBInclineWeight = Int(dbInclineLabel.text ?? "")
        let newDBInclineWeight = currentDBInclineWeight! + 5
        dbInclineLabel.text = String(newDBInclineWeight)
    }
    @IBAction func dbInclineWeightDown(_ sender: Any) {
        let currentDBInclineWeight = Int(dbInclineLabel.text ?? "")
        let newDBInclineWeight = currentDBInclineWeight! - 5
        dbInclineLabel.text = String(newDBInclineWeight)
    }
    @IBAction func dbCurlWeightUp(_ sender: Any) {
        let currentDBCurlWeight = Int(dbCurlLabel.text ?? "")
        let newDBCurlWeight = currentDBCurlWeight! + 5
        dbCurlLabel.text = String(newDBCurlWeight)
    }
    @IBAction func dbCurlWeightDown(_ sender: Any) {
        let currentDBCurlWeight = Int(dbCurlLabel.text ?? "")
        let newDBCurlWeight = currentDBCurlWeight! - 5
        dbCurlLabel.text = String(newDBCurlWeight)
    }
    @IBAction func hCurlWeightUp(_ sender: Any) {
        let currentHCurlWeight = Int(hCurlLabel.text ?? "")
        let newHCurlWeight = currentHCurlWeight! + 5
        hCurlLabel.text = String(newHCurlWeight)
    }
    @IBAction func hCurlWeightDown(_ sender: Any) {
        let currentHCurlWeight = Int(hCurlLabel.text ?? "")
        let newHCurlWeight = currentHCurlWeight! - 5
        hCurlLabel.text = String(newHCurlWeight)
    }
    @IBAction func sCrusherWeightUp(_ sender: Any) {
        let currentSCrusherWeight = Int(sCrusherLabel.text ?? "")
        let newSCrusherWeight = currentSCrusherWeight! + 5
        sCrusherLabel.text = String(newSCrusherWeight)
    }
    @IBAction func sCrusherWeightDown(_ sender: Any) {
        let currentSCrusherWeight = Int(sCrusherLabel.text ?? "")
        let newSCrusherWeight = currentSCrusherWeight! - 5
        sCrusherLabel.text = String(newSCrusherWeight)
    }
    @IBAction func tPushDownWeightUp(_ sender: Any) {
        let currentTPushDownWeight = Int(tPushDownLabel.text ?? "")
        let newTPushDownWeight = currentTPushDownWeight! + 5
        tPushDownLabel.text = String(newTPushDownWeight)
    }
    @IBAction func tPushDownWeightDown(_ sender: Any) {
        let currentTPushDownWeight = Int(tPushDownLabel.text ?? "")
        let newTPushDownWeight = currentTPushDownWeight! - 5
        tPushDownLabel.text = String(newTPushDownWeight)
    }
    @IBAction func squatWeightUp(_ sender: Any) {
        let currentSquatWeight = Int(squatLabel.text ?? "")
        let newSquatWeight = currentSquatWeight! + 5
        squatLabel.text = String(newSquatWeight)
    }
    @IBAction func squatWeightDown(_ sender: Any) {
        let currentSquatWeight = Int(squatLabel.text ?? "")
        let newSquatWeight = currentSquatWeight! - 5
        squatLabel.text = String(newSquatWeight)
    }
    @IBAction func rdlWeightUp(_ sender: Any) {
        let currentRDLWeight = Int(rdlLabel.text ?? "")
        let newRDLWeight = currentRDLWeight! + 5
        rdlLabel.text = String(newRDLWeight)
    }
    @IBAction func rdlWeightDown(_ sender: Any) {
        let currentRDLWeight = Int(rdlLabel.text ?? "")
        let newRDLWeight = currentRDLWeight! - 5
        rdlLabel.text = String(newRDLWeight)
    }
    @IBAction func fSquatWeightUp(_ sender: Any) {
        let currentFSquatWeight = Int(fSquatLabel.text ?? "")
        let newFSquatWeight = currentFSquatWeight! + 5
        fSquatLabel.text = String(newFSquatWeight)
    }
    @IBAction func fSquatWeightDown(_ sender: Any) {
        let currentFSquatWeight = Int(fSquatLabel.text ?? "")
        let newFSquatWeight = currentFSquatWeight! - 5
        fSquatLabel.text = String(newFSquatWeight)
    }
    @IBAction func deadliftWeightUp(_ sender: Any) {
        let currentDeadliftWeight = Int(deadliftLabel.text ?? "")
        let newDeadliftWeight = currentDeadliftWeight! + 5
        deadliftLabel.text = String(newDeadliftWeight)
    }
    @IBAction func deadliftWeightDown(_ sender: Any) {
        let currentDeadliftWeight = Int(deadliftLabel.text ?? "")
        let newDeadliftWeight = currentDeadliftWeight! - 5
        deadliftLabel.text = String(newDeadliftWeight)
    }
    @IBAction func hexDeadliftWeightUp(_ sender: Any) {
        let currentHexDeadliftWeight = Int(hexDeadliftLabel.text ?? "")
        let newHexDeadliftWeight = currentHexDeadliftWeight! + 5
        hexDeadliftLabel.text = String(newHexDeadliftWeight)
    }
    @IBAction func hexDeadliftWeightDown(_ sender: Any) {
        let currentHexDeadliftWeight = Int(hexDeadliftLabel.text ?? "")
        let newHexDeadliftWeight = currentHexDeadliftWeight! - 5
        hexDeadliftLabel.text = String(newHexDeadliftWeight)
    }
    @IBAction func dbLungeWeightUp(_ sender: Any) {
        let currentDBLungeWeight = Int(dbLungeLabel.text ?? "")
        let newDBLungeWeight = currentDBLungeWeight! + 5
        dbLungeLabel.text = String(newDBLungeWeight)
    }
    @IBAction func dbLungeWeightDown(_ sender: Any) {
        let currentDBLungeWeight = Int(dbLungeLabel.text ?? "")
        let newDBLungeWeight = currentDBLungeWeight! - 5
        dbLungeLabel.text = String(newDBLungeWeight)
    }
}
