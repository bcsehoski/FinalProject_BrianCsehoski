//
//  ProfilePage.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 4/30/24.
//

import UIKit

class ProfilePage: UIViewController {
    
    var profile: Profile?
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tbc = tabBarController as? TabBarSubclass {
            guard let profile = tbc.profile else { return }
            fNameLabel.text = profile.firstName
            lNameLabel.text = profile.lastName
            ageLabel.text = profile.age
            emailLabel.text = profile.email
            if profile.hypertrophyWorkout == true {
                hypertrophyLabel.text = "Yes"
                strengthLabel.text = "No"
            } else if profile.strengthWorkout == true {
                hypertrophyLabel.text = "No"
                strengthLabel.text = "Yes"
            }
            benchLabel.text = String(profile.bbBenchWeight)
            sPressLabel.text = String(profile.shoulderPressWeight)
            rowLabel.text = String(profile.rowWeight)
            dbInclineLabel.text = String(profile.dbInclineWeight)
            dbCurlLabel.text = String(profile.dbCurlWeight)
            hCurlLabel.text = String(profile.hCurlWeight)
            sCrusherLabel.text = String(profile.skullCrusherWeight)
            tPushDownLabel.text = String(profile.tricepPDownWeight)
            squatLabel.text = String(profile.squatWeight)
            rdlLabel.text = String(profile.rdlWeight)
            fSquatLabel.text = String(profile.fSquatWeight)
            deadliftLabel.text = String(profile.deadLiftWeight)
            hexDeadliftLabel.text = String(profile.hexBarWeight)
            dbLungeLabel.text = String(profile.dbLungeWeight)
        }
    }
}
