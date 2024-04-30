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
    var workoutRepDictionary = [
        "hypertrophy": [
            "Monday": [
                "bench": 12,
                "shoulderPress": 8,
                "rows": 10,
                "dbIncline": 12
            ],
            "Wednseday": [
                "dbCurl": 30,
                "hCurl": 30,
                "sCrushers": 12,
                "tPullDown": 50
            ],
            "Friday": [
                "squat": 8,
                "rdl": 8,
                "fSquat": 8,
                "deadlift": 8,
                "hexDeadlift": 10,
                "dbLunge": 16
            ]
        ],
        "strength": [
            "Monday": [
                "bench": 3,
                "shoulderPress": 5,
                "rows": 8,
                "dbIncline": 6
            ],
            "Wednesday": [
                "dbCurl": 20,
                "hCurl": 20,
                "sCrushers": 6,
                "tPullDown": 12
            ],
            "Friday": [
                "squat": 3,
                "rdl": 5,
                "fSquat": 3,
                "deadlift": 5,
                "hexDeadlift": 6,
                "dbLunge": 10
            ]
        ]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if let tbc = tabBarController as? TabBarSubclass {
//            profile = tbc.profile
//            guard let profile = tbc.profile else { return }
//            print(profile)
//            
//            if profile.hypertrophyWorkout == true {
//                mondayBenchSets.text = String(hypertrophySets)
//                mondaysPressSets.text = String(hypertrophySets)
//                mondayRowSets.text = String(hypertrophySets)
//                mondayInclineSets.text = String(hypertrophySets)
//                mondaysPressWeight.text = String(profile.shoulderPressWeight)
//                mondayBenchWeight.text = String(profile.bbBenchWeight)
//                mondayRowWeight.text = String(profile.rowWeight)
//                mondayInclineWeight.text = String(profile.dbInclineWeight)
//                
//                wedDbCurlSets.text = String(hypertrophySets)
//                wedHCurlSets.text = String(hypertrophySets)
//                wedSCrusherSets.text = String(hypertrophySets)
//                wedTPullDownSets.text = String(hypertrophySets)
//                wedDbCurlWeight.text = String(profile.dbCurlWeight)
//                wedHCurlWeight.text = String(profile.hCurlWeight)
//                wedSCrusherWeight.text = String(profile.skullCrusherWeight)
//                wedTPullDownWeight.text = String(profile.tricepPDownWeight)
//                
//                friSquatSets.text = String(hypertrophySets)
//                friRDLSets.text = String(hypertrophySets)
//                friFSquatSets.text = String(hypertrophySets)
//                friDLSets.text = String(hypertrophySets)
//                friHexDLSets.text = String(hypertrophySets)
//                friDBLungeSets.text = String(hypertrophySets)
//                friSquatWeight.text = String(profile.squatWeight)
//                friRDLWeight.text = String(profile.rdlWeight)
//                friFSquatWeight.text = String(profile.fSquatWeight)
//                friDLWeight.text = String(profile.deadLiftWeight)
//                friHexDLWeight.text = String(profile.hexBarWeight)
//                friDBLungeWeight.text = String(profile.dbLungeWeight)
//            } else if profile.strengthWorkout == true {
//                mondayBenchSets.text = String(strengthSets)
//                mondaysPressSets.text = String(strengthSets)
//                mondayRowSets.text = String(strengthSets)
//                mondayInclineSets.text = String(strengthSets)
//                mondaysPressWeight.text = String(profile.shoulderPressWeight)
//                mondayBenchWeight.text = String(profile.bbBenchWeight)
//                mondayRowWeight.text = String(profile.rowWeight)
//                mondayInclineWeight.text = String(profile.dbInclineWeight)
//                
//                wedDbCurlSets.text = String(strengthSets)
//                wedHCurlSets.text = String(strengthSets)
//                wedSCrusherSets.text = String(strengthSets)
//                wedTPullDownSets.text = String(strengthSets)
//                wedDbCurlWeight.text = String(profile.dbCurlWeight)
//                wedHCurlWeight.text = String(profile.hCurlWeight)
//                wedSCrusherWeight.text = String(profile.skullCrusherWeight)
//                wedTPullDownWeight.text = String(profile.tricepPDownWeight)
//                
//                friSquatSets.text = String(strengthSets)
//                friRDLSets.text = String(strengthSets)
//                friFSquatSets.text = String(strengthSets)
//                friDLSets.text = String(strengthSets)
//                friHexDLSets.text = String(strengthSets)
//                friDBLungeSets.text = String(strengthSets)
//                friSquatWeight.text = String(profile.squatWeight)
//                friRDLWeight.text = String(profile.rdlWeight)
//                friFSquatWeight.text = String(profile.fSquatWeight)
//                friDLWeight.text = String(profile.deadLiftWeight)
//                friHexDLWeight.text = String(profile.hexBarWeight)
//                friDBLungeWeight.text = String(profile.dbLungeWeight)
//            }
//        }
        
        
                
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let tbc = tabBarController as? TabBarSubclass {
            profile = tbc.profile
            guard let profile = tbc.profile else { return }
            print(profile)
            
            if profile.hypertrophyWorkout == true {
                mondayBenchSets.text = String(hypertrophySets)
                mondaysPressSets.text = String(hypertrophySets)
                mondayRowSets.text = String(hypertrophySets)
                mondayInclineSets.text = String(hypertrophySets)
                mondaysPressWeight.text = String(profile.shoulderPressWeight)
                mondayBenchWeight.text = String(profile.bbBenchWeight)
                mondayRowWeight.text = String(profile.rowWeight)
                mondayInclineWeight.text = String(profile.dbInclineWeight)
                mondayBenchReps.text = "12"
                mondaysPressReps.text = "8"
                mondayRowReps.text = "10"
                mondayInclineReps.text = "12"
                
                wedDbCurlSets.text = String(hypertrophySets)
                wedHCurlSets.text = String(hypertrophySets)
                wedSCrusherSets.text = String(hypertrophySets)
                wedTPullDownSets.text = String(hypertrophySets)
                wedDbCurlWeight.text = String(profile.dbCurlWeight)
                wedHCurlWeight.text = String(profile.hCurlWeight)
                wedSCrusherWeight.text = String(profile.skullCrusherWeight)
                wedTPullDownWeight.text = String(profile.tricepPDownWeight)
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
                friSquatWeight.text = String(profile.squatWeight)
                friRDLWeight.text = String(profile.rdlWeight)
                friFSquatWeight.text = String(profile.fSquatWeight)
                friDLWeight.text = String(profile.deadLiftWeight)
                friHexDLWeight.text = String(profile.hexBarWeight)
                friDBLungeWeight.text = String(profile.dbLungeWeight)
                friSquatReps.text = "8"
                friRDLReps.text = "8"
                friFSquatReps.text = "8"
                friDLReps.text = "8"
                firHexDLReps.text = "10"
                friDBLungeReps.text = "16"
            } else if profile.strengthWorkout == true {
                mondayBenchSets.text = String(strengthSets)
                mondaysPressSets.text = String(strengthSets)
                mondayRowSets.text = String(strengthSets)
                mondayInclineSets.text = String(strengthSets)
                mondaysPressWeight.text = String(profile.shoulderPressWeight)
                mondayBenchWeight.text = String(profile.bbBenchWeight)
                mondayRowWeight.text = String(profile.rowWeight)
                mondayInclineWeight.text = String(profile.dbInclineWeight)
                mondayBenchReps.text = "3"
                mondaysPressReps.text = "5"
                mondayRowReps.text = "8"
                mondayInclineReps.text = "5"
                
                wedDbCurlSets.text = String(strengthSets)
                wedHCurlSets.text = String(strengthSets)
                wedSCrusherSets.text = String(strengthSets)
                wedTPullDownSets.text = String(strengthSets)
                wedDbCurlWeight.text = String(profile.dbCurlWeight)
                wedHCurlWeight.text = String(profile.hCurlWeight)
                wedSCrusherWeight.text = String(profile.skullCrusherWeight)
                wedTPullDownWeight.text = String(profile.tricepPDownWeight)
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
                friSquatWeight.text = String(profile.squatWeight)
                friRDLWeight.text = String(profile.rdlWeight)
                friFSquatWeight.text = String(profile.fSquatWeight)
                friDLWeight.text = String(profile.deadLiftWeight)
                friHexDLWeight.text = String(profile.hexBarWeight)
                friDBLungeWeight.text = String(profile.dbLungeWeight)
                friSquatReps.text = "3"
                friRDLReps.text = "5"
                friFSquatReps.text = "3"
                friDLReps.text = "5"
                firHexDLReps.text = "6"
                friDBLungeReps.text = "10"
            }
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let landingVC = segue.destination as? FirstTimePage else { return }
        landingVC.profile = profile
        
    }
    
    @IBSegueAction func firstTime(_ coder: NSCoder, sender: Any?) -> FirstTimePage? {
        return FirstTimePage(coder: coder, profile: profile)
    }
    
    @IBAction func unwindFirstTime(_ seg: UIStoryboardSegue) {
        guard seg.identifier == "createAccountUnwind",
              let sourceViewController = seg.source as? FirstTimePage,
              let updatedProfile = sourceViewController.profile else {return}
        if let tbc = tabBarController as? TabBarSubclass {
            tbc.profile = updatedProfile
        }
        profile = updatedProfile
        print(profile)
    }
    
    

    
    
    
}
