//
//  HomePage.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 3/29/24.
//

import UIKit

class FirstTimePage: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var ageTextView: UITextField!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var lastNameTextView: UITextField!
    @IBOutlet weak var firstNameTextView: UITextField!
    var profile: Profile?
    @IBOutlet weak var workoutTypeSelector: UIPickerView!
    var pickerData: [String] = [String]()
    var selectedWorkout: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.workoutTypeSelector.delegate = self
        self.workoutTypeSelector.dataSource = self
        pickerData = ["Strength", "Hypertrophy"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedWorkout = pickerData[row]
    }
    
    @IBAction func submitClicked(_ sender: Any) {
        if checkAge() && checkFirstName() && checkLastName() && checkEmail() {
            print("Before")
            performSegue(withIdentifier: "unwindFirstTime", sender: nil)
        } else {
            print("Enter all info")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "unwindFirstTime" else {return}
        let fName = firstNameTextView.text ?? ""
        let lName = lastNameTextView.text ?? ""
        let email = emailTextView.text ?? ""
        let age = ageTextView.text ?? ""
        
        profile?.firstName = fName
        profile?.lastName = lName
        profile?.age = age
        profile?.email = email
        if selectedWorkout == "Hypertrophy" {
            profile?.hypertrophyWorkout = true
            profile?.strengthWorkout = false
        } else {
            profile?.strengthWorkout = true
            profile?.hypertrophyWorkout = false
        }
        print(profile)
        
    }
    
    init?(coder: NSCoder, profile: Profile?) {
        self.profile = profile
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkFirstName() -> Bool {
        if firstNameTextView.text != "" {
            return true
        }
        return false
    }
    
    func checkLastName() -> Bool {
        if lastNameTextView.text != "" {
            return true
        }
        return false
    }
    
    func checkEmail() -> Bool {
        if emailTextView.text != "" {
            return true
        }
        return false
    }
    
    func checkAge() -> Bool {
        if ageTextView.text != "" {
            return true
        }
        return false
    }
    
    

    
    
    

}

