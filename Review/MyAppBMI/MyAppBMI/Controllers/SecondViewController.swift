//
//  SecondViewController.swift
//  MyAppBMI
//
//  Created by Nova on 2024/07/30.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
   
    var bmi: BMI?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // 전화면에서 전달받은 데이터 세팅
        bmiNumberLabel.text = "\(bmi!.value)"
        bmiNumberLabel.backgroundColor = bmi?.matchColor
        adviceLabel.text = bmi?.advice
        
        backButton.layer.cornerRadius = 5
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
