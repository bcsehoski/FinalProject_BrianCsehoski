//
//  WorkoutPage.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 4/22/24.
//

import UIKit

class WorkoutPage: UIViewController {
    
    
    var hypertrophySets = 4
    var strengthSets = 6
    
    var profile: Profile?
    var updatedProfile: Profile?
    
    var profiles: [Profile] = [] {
        didSet {
            Profile.saveToFile(profiles: profiles)
        }
    }
    
    @IBOutlet weak var mondayBenchSets: UILabel!
    @IBOutlet weak var mondayBenchReps: UILabel!
    @IBOutlet weak var mondayBenchWeight: UILabel!
    @IBOutlet weak var mondaysPressSets: UILabel!
    @IBOutlet weak var mondaysPressReps: UILabel!
    @IBOutlet weak var mondaysPressWeight: UILabel!
    @IBOutlet weak var mondayRowSets: UILabel!
    @IBOutlet weak var mondayRowReps: UILabel!
    @IBOutlet weak var mondayRowWeight: UILabel!
    @IBOutlet weak var mondayInclineSets: UILabel!
    @IBOutlet weak var mondayInclineReps: UILabel!
    @IBOutlet weak var mondayInclineWeight: UILabel!
    
    @IBOutlet weak var wedDbCurlSets: UILabel!
    @IBOutlet weak var wedDbCurlReps: UILabel!
    @IBOutlet weak var wedDbCurlWeight: UILabel!
    @IBOutlet weak var wedHCurlSets: UILabel!
    @IBOutlet weak var wedHCurlReps: UILabel!
    @IBOutlet weak var wedHCurlWeight: UILabel!
    @IBOutlet weak var wedSCrusherSets: UILabel!
    @IBOutlet weak var wedSCrusherReps: UILabel!
    @IBOutlet weak var wedSCrusherWeight: UILabel!
    @IBOutlet weak var wedTPullDownSets: UILabel!
    @IBOutlet weak var wedTPullDownReps: UILabel!
    @IBOutlet weak var wedTPullDownWeight: UILabel!
    
    @IBOutlet weak var friSquatSets: UILabel!
    @IBOutlet weak var friSquatReps: UILabel!
    @IBOutlet weak var friSquatWeight: UILabel!
    @IBOutlet weak var friRDLSets: UILabel!
    @IBOutlet weak var friRDLReps: UILabel!
    @IBOutlet weak var friRDLWeight: UILabel!
    @IBOutlet weak var friFSquatSets: UILabel!
    @IBOutlet weak var friFSquatReps: UILabel!
    @IBOutlet weak var friFSquatWeight: UILabel!
    @IBOutlet weak var friDLSets: UILabel!
    @IBOutlet weak var friDLReps: UILabel!
    @IBOutlet weak var friDLWeight: UILabel!
    @IBOutlet weak var friHexDLSets: UILabel!
    @IBOutlet weak var firHexDLReps: UILabel!
    @IBOutlet weak var friHexDLWeight: UILabel!
    @IBOutlet weak var friDBLungeSets: UILabel!
    @IBOutlet weak var friDBLungeReps: UILabel!
    @IBOutlet weak var friDBLungeWeight: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        if let savedProfiles = Profile.loadFromFile() {
            profiles = savedProfiles
        } else {
            profiles = Profile.startingProfiles
        }
        
        updateUI()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateUI()
        print("hello")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let landingVC = segue.destination as? FirstTimePage else { return }
        landingVC.profile = profile
        
    }
    
    @IBAction func unwindFirstTime(_ seg: UIStoryboardSegue) {
        guard seg.identifier == "unwindFirstTime" else {return}
        print("Unwinded")
        
    }
    
    func updateUI() {
        
        
        
        
        
        if let tbc = tabBarController as? TabBarSubclass {
            
            if let savedProfiles = Profile.loadFromFile() {
                profiles = savedProfiles
            } else {
                profiles = Profile.startingProfiles
            }
            
            profile = tbc.profile
            guard let profile = tbc.profile else { return }
            print(profile)
            var currentProfileIndex = 0
            for i in 0...profiles.count - 1 {
                if profiles[i].username == profile.username {
                    currentProfileIndex = i
                }
            }
            let currentProfile = profiles[currentProfileIndex]
            print(currentProfile)
            
            
            if currentProfile.hypertrophyWorkout == true {
                mondayBenchSets.text = String(hypertrophySets)
                mondaysPressSets.text = String(hypertrophySets)
                mondayRowSets.text = String(hypertrophySets)
                mondayInclineSets.text = String(hypertrophySets)
                mondaysPressWeight.text = String(currentProfile.shoulderPressWeight)
                mondayBenchWeight.text = String(currentProfile.bbBenchWeight)
                mondayRowWeight.text = String(currentProfile.rowWeight)
                mondayInclineWeight.text = String(currentProfile.dbInclineWeight)
                mondayBenchReps.text = "12"
                mondaysPressReps.text = "8"
                mondayRowReps.text = "10"
                mondayInclineReps.text = "12"
                
                wedDbCurlSets.text = String(hypertrophySets)
                wedHCurlSets.text = String(hypertrophySets)
                wedSCrusherSets.text = String(hypertrophySets)
                wedTPullDownSets.text = String(hypertrophySets)
                wedDbCurlWeight.text = String(currentProfile.dbCurlWeight)
                wedHCurlWeight.text = String(currentProfile.hCurlWeight)
                wedSCrusherWeight.text = String(currentProfile.skullCrusherWeight)
                wedTPullDownWeight.text = String(currentProfile.tricepPDownWeight)
                wedDbCurlReps.text = "30"
                wedHCurlReps.text = "30"
                wedSCrusherReps.text = "12"
                wedTPullDownReps.text = "50"
                
                friSquatSets.text = String(hypertrophySets)
                friRDLSets.text = String(hypertrophySets)
                friFSquatSets.text = String(hypertrophySets)
                friDLSets.text = String(hypertrophySets)
                friHexDLSets.text = String(hypertrophySets)
                friDBLungeSets.text = String(hypertrophySets)
                friSquatWeight.text = String(currentProfile.squatWeight)
                friRDLWeight.text = String(currentProfile.rdlWeight)
                friFSquatWeight.text = String(currentProfile.fSquatWeight)
                friDLWeight.text = String(currentProfile.deadLiftWeight)
                friHexDLWeight.text = String(currentProfile.hexBarWeight)
                friDBLungeWeight.text = String(currentProfile.dbLungeWeight)
                friSquatReps.text = "8"
                friRDLReps.text = "8"
                friFSquatReps.text = "8"
                friDLReps.text = "8"
                firHexDLReps.text = "10"
                friDBLungeReps.text = "16"
            } else if currentProfile.strengthWorkout == true {
                mondayBenchSets.text = String(strengthSets)
                mondaysPressSets.text = String(strengthSets)
                mondayRowSets.text = String(strengthSets)
                mondayInclineSets.text = String(strengthSets)
                mondaysPressWeight.text = String(currentProfile.shoulderPressWeight)
                mondayBenchWeight.text = String(currentProfile.bbBenchWeight)
                mondayRowWeight.text = String(currentProfile.rowWeight)
                mondayInclineWeight.text = String(currentProfile.dbInclineWeight)
                mondayBenchReps.text = "3"
                mondaysPressReps.text = "5"
                mondayRowReps.text = "8"
                mondayInclineReps.text = "5"
                
                wedDbCurlSets.text = String(strengthSets)
                wedHCurlSets.text = String(strengthSets)
                wedSCrusherSets.text = String(strengthSets)
                wedTPullDownSets.text = String(strengthSets)
                wedDbCurlWeight.text = String(currentProfile.dbCurlWeight)
                wedHCurlWeight.text = String(currentProfile.hCurlWeight)
                wedSCrusherWeight.text = String(currentProfile.skullCrusherWeight)
                wedTPullDownWeight.text = String(currentProfile.tricepPDownWeight)
                wedDbCurlReps.text = "20"
                wedHCurlReps.text = "20"
                wedSCrusherReps.text = "6"
                wedTPullDownReps.text = "12"
                
                friSquatSets.text = String(strengthSets)
                friRDLSets.text = String(strengthSets)
                friFSquatSets.text = String(strengthSets)
                friDLSets.text = String(strengthSets)
                friHexDLSets.text = String(strengthSets)
                friDBLungeSets.text = String(strengthSets)
                friSquatWeight.text = String(currentProfile.squatWeight)
                friRDLWeight.text = String(currentProfile.rdlWeight)
                friFSquatWeight.text = String(currentProfile.fSquatWeight)
                friDLWeight.text = String(currentProfile.deadLiftWeight)
                friHexDLWeight.text = String(currentProfile.hexBarWeight)
                friDBLungeWeight.text = String(currentProfile.dbLungeWeight)
                friSquatReps.text = "3"
                friRDLReps.text = "5"
                friFSquatReps.text = "3"
                friDLReps.text = "5"
                firHexDLReps.text = "6"
                friDBLungeReps.text = "10"
            }
            
        }
        
    }
    
    @IBSegueAction func firstTime(_ coder: NSCoder, sender: Any?) -> FirstTimePage? {
        return FirstTimePage(coder: coder, profile: profile)
    }
    
    
    

    
    
    
}
