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
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }

    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.setTitle("다시 계산하기", for: .normal)
        
        // 옵셔널로 받았으므로 한번 벗겨서 사용
        guard let bmiNumber = bmiNumber else { return }
        bmiNumberLabel.text = String(bmiNumber)
        adviceLabel.text = adviceString
        bmiNumberLabel.backgroundColor = bmiColor
    }

    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
