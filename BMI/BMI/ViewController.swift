//
//  ViewController.swift
//  BMI
//
//  Created by Nova on 2024/07/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 대리자 설정
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        makeUI()
    }

    func makeUI() {
        mainLabel.text = "키와 몸무게를 입력해 주세요."
        // 모서리 둥글게
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm 단위로 입력해 주세요."
        weightTextField.placeholder = "kg 단위로 입력해 주세요."
    }
    

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
    
    
}

// 텍스트필드를 사용할 때는 UITextFieldDelegate를 채택해서 메서드들을 구현
extension ViewController: UITextFieldDelegate {
    
}
