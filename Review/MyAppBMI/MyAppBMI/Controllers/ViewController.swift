//
//  ViewController.swift
//  MyAppBMI
//
//  Created by Nova on 2024/07/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    // 비자니스로직 담당 - BMI 계산 과 관련된 모든것
    var bmiManager = BMICalculatorManager()
    
    // var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightTextField.delegate = self
        weightTextField.delegate = self
        configureUI()
    
    }

    // UI 세팅
    func configureUI() {
        calculateButton.layer.cornerRadius = 5
        heightTextField.placeholder = "키를 입력해주세요."
        weightTextField.placeholder = "몸무게를 입력해주세요."
        mainLabel.text = "키와 몸무게를 입력해 주세요"
    }
    
    // BMI 계산하기 - 버튼 누르면 다음화면
    @IBAction func calculateButtonTapped(_ sender: Any) {
        // bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
    }
    
    // 조건
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력해주셔야 합니다."
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        return true
    }
    
    // 다음화면 넘어가기 전 준비(데이터 전달)
    // 전달할 데이터? 키/몸무게
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 식별자 확인
        if segue.identifier == "toSecondVC" {   // secondViewController
            let secondVC = segue.destination as! SecondViewController
            secondVC.modalPresentationStyle = .fullScreen
            
            let bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
            secondVC.bmi = bmi
        }
        
        // 다음화면으로 가기 전 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    

}


// Delegate
extension ViewController: UITextFieldDelegate {
    // 텍스트를 입력하거나/지우거나 할 때마다 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 숫자만 입력 허용
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    // 엔터키가 눌렸을 때 다음동작
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두번째 텍스트필드로 넘어가도록
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
     }
    
    
    // 텍스트필드 이외 영역을 눌렀을 때 키보드 내려가도록
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}


