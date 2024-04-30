//
//  CreateAccount.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 3/29/24.
//

import UIKit

class CreateAccount: UIViewController {
    
    var profile: Profile?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var firstPwordTextField: UITextField!
    @IBOutlet weak var secondPwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var CreateAccountStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("create account page loaded")
        
    }
    
    init?(coder: NSCoder, profile: Profile?) {
        self.profile = profile
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func createAccountPressed(_ sender: Any) {
        if checkLowercase() && checkUppercase() && checkPasswordLength() && checkSpecialCharacter() {
            print("Before")
            performSegue(withIdentifier: "createAccountUnwind", sender: nil)
        } else {
            print("Incorrect info")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "createAccountUnwind" else { return }
        
        let username = usernameTextField.text ?? ""
        let password = firstPwordTextField.text ?? ""
        profile = Profile(username: username, password: password, firstName: "", lastName: "", age: "", email: "", strengthWorkout: false, hypertrophyWorkout: false, bbBenchWeight: 125, shoulderPressWeight: 95, rowWeight: 135, dbInclineWeight: 50, dbCurlWeight: 40, hCurlWeight: 50, skullCrusherWeight: 95, tricepPDownWeight: 40, squatWeight: 225, rdlWeight: 185, fSquatWeight: 205, deadLiftWeight: 275, hexBarWeight: 275, dbLungeWeight: 50)
    }
    
    func checkPasswordLength() -> Bool {
        if let password = firstPwordTextField.text {
            if password.count >= 6 {
                return true
            }
        }
        return false
    }
    
    func checkLowercase() -> Bool {
        if let password = firstPwordTextField.text {
            for char in password {
                if char.isLowercase {
                    return true
                }
            }
        }
        return false
    }
    
    func checkUppercase() -> Bool {
        if let password = firstPwordTextField.text {
            for char in password {
                if char.isUppercase {
                    return true
                }
            }
        }
        return false
    }
    
    func checkSpecialCharacter() -> Bool {
        var regularCharacters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
        if let password = firstPwordTextField.text {
            for char in password {
                if !regularCharacters.contains(String(char)) {
                    return true
                }
            }
        }
        return false
    }
    
    
    
}
