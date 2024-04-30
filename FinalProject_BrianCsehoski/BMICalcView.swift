//
//  BMI Calculator View.swift
//  FinalProject_BrianCsehoski
//
//  Created by Brian Csehoski on 4/19/24.
//

import UIKit
import WebKit

class BMICalcView: UIViewController {
    
    @IBOutlet weak var bmiCalcOutlet: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myURL: URL? = URL(string: "https://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm")
        let myReq = URLRequest(url: myURL!)
        bmiCalcOutlet.load(myReq)
        
    }


}
