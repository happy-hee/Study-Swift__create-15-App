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
    
    // 결과값 보관을 위한 변수
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 대리자 설정
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        makeUI()
    }

    func makeUI() {
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        // 모서리 둥글게
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        heightTextField.placeholder = "cm 단위로 입력해 주세요"
        weightTextField.placeholder = "kg 단위로 입력해 주세요"
    }
    

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // BMI 결과값 뽑아내기
        guard let height = heightTextField.text,
              let weight = weightTextField.text else { return }
        bmi = calculateBMI(height: height, weight: weight)
    }
    
    // 조건에 따라 다음화면 이동할지 말지(무조건 화면 이동이 일어난다면 이 코드는 작성하지 않아도 괜찮음)
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력을 하셔야 합니다"
            mainLabel.textColor = .red
            return false    // 화면 이동이 일어나지 않음
        }
        mainLabel.text = "키와 몸무게를 입력해 주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    // 다음화면 넘어가기 전 준비 (일반적으로 데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 식별자 확인
        // segue: Segueway, 스토리보드에서 화면과 화면을 이을 때의 선? 부분을 가리킴
        if segue.identifier == "toSecondVC" {   // 이동할 페이지와의 segue 부분의 identifier가 toSecondVC
            // SecondViewController 에 접근 가능하도록
            let secondVC = segue.destination as! SecondViewController
            // 데이터(bmi 값) 전달
            secondVC.bmiNumber = self.bmi
            secondVC.adviceString = getBMIAdviceString()
            secondVC.bmiColor = getBackgroundColor()
        }
        
        // 다음화면으로 넘어가기 전에 텍스트필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    // BMI 계산 메서드
    func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10  // 반올림
        return bmi
    }
    
    // BMI 값에 따라 색 얻는 메서드
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // BMI 값에 따라 문자열 얻는 메서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비안"
        default:
            return ""
        }
    }
}

// 텍스트필드를 사용할 때는 UITextFieldDelegate를 채택해서 메서드들을 구현
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 숫자만 입력 허용
        // 모든 텍스트필드에 적용(각각 다르게 적용하고 싶다면 if문 사용)
        if Int(string) != nil || string == "" {
            return true
        } else {
            return false
        }
    }
    
    // 키보드 엔터키(Return)가 눌렸을 때 (다음 동작 허락 여부 Bool)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        
        return false
    }
    
    // 텍스트필드 이외의 영역을 눌렀을 때 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        weightTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
    }
}
