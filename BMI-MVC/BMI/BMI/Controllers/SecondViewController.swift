//
//  SecondViewController.swift
//  BMI
//
//  Created by Nova on 7/15/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // 데이터를 전달받을 변수(보통 옵셔널)
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 혹시나 guard let문 때문에 벗어나지 않도록 먼저 호출
        makeUI()
        
        guard let bmi = bmi else {
            return
        }
        
        bmiNumberLabel.text = "\(bmi.value)"
        adviceLabel.text = bmi.advice
        bmiNumberLabel.backgroundColor = bmi.matchColor
        
        
    }

    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.setTitle("다시 계산하기", for: .normal)
    
    }

    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
