//
//  TabBarSubclass.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 4/26/24.
//

import UIKit

class TabBarSubclass: UITabBarController {
    var profile: Profile?
    
    
//    @IBAction func unwindFirstTime(_ seg: UIStoryboardSegue) {
//        guard seg.identifier == "unwindFirstTime",
//              let sourceViewController = seg.source as? FirstTimePage,
//              let updatedProfile = sourceViewController.profile else {return}
//        profile = updatedProfile
//        
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func updateProfile() {
        
    }
    
}
