//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Nova on 2024/06/26.
//

import UIKit

// UITextFieldDelegate 프로토콜(자격증)을 채택
class ViewController: UIViewController, UITextFieldDelegate {
    /**
     [DelegatePattern.playground 파일 참고하여 비교하면 이해가 쉬움]
     
     1) protocol UITextFieldDelegate        * RemoteControlDelegate
       - 텍스트필드 프로토콜(델리게이트 프로토콜, 자격증)
     
     2) class UITextField       * RemoteControl
       - 유저와 커뮤니케이션(예시 - 유저가 입력했다는 '동작' 을 전달)
       - 프로토콜, 델리게이트 패턴을 활용해서 ViewController 한테 이 '동작'을 전달
         (textField의 대리자는 ViewController)
       "텍스트필드에 입력이라는 '동작'이 일어나고 있어!"
     
     3) class ViewController        * TV (RemoteControlDelegate 자격증을 채택하여 RemoteControl을 사용)
       - UITextField와 커뮤니케이션
       - 메서드 실행(구체적인 구현, 동작)
       "입력이라는 '동작'이 일어난다고? 그럼 이렇게 할래(구체적인 구현)"
     */
    

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        textField.delegate = self   // delegate: 대리자 설정 -> 이 self(ViewController) 가 컨트롤러가 된다고 설정
        
        // 최초 응답자(responder) 설정
        // 화면에 들어오면 텍스트필드가 가장 먼저 입력받는 상태가 됨
        textField.becomeFirstResponder()    // 키보드가 올라옴
        // textField.resignFirstResponder()
    }
    
    // 기본 UI설정
    func setupUI() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = UIKeyboardType.emailAddress    // 입력타입 -> 이메일
        textField.placeholder = "이메일 입력"    // placeholder
        textField.borderStyle = .roundedRect    // 가장자리 둥글게
        textField.clearButtonMode = .always     // Clear 버튼 여부
        textField.returnKeyType = .next     // return(엔터)키의 형태
    }
    
    
    // 텍스트필드에 입력 시작시 호출 (시작할지 말지의 여부를 처리)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)    // 이 함수의 이름을 출력
        return true
    }
    
    // 텍스트필드에 입력 시작시 실행 (시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("입력 시작")
    }
    
    // Clear 버튼 작동 여부
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true    // false로 해두면 x 버튼 눌러도 글자들이 지워지지 않음
    }
    
    // 텍스트에 입력을 할 때마다 이 메서드를 불러옴
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print(string)   // 내가 입력한 텍스트가 string에 들어감
        
        // 입력되고 있는 글자가 "숫자"인 경우, 입력을 허용하지 않는 논리
        if Int(string) != nil { // 숫자로 변환이 된다면 nil이 아님
            return false
        } else {
            // 10글자 이상 입력 되는 걸 막는 코드
            guard let text = textField.text else {
                return true
            }
            let newLength = text.count + string.count - range.length
            return newLength <= 10  // 제한 숫자
        }
        
        // 10글자 이상 입력 되는 걸 막는 코드 (또다른 방법)
//        if (textField.text?.count)! + string.count > 10 {
//            return false
//        } else {
//            return true
//        }
        
        
        // return  true
    }
    
    // 텍스트필드에 return(엔터키)가 눌러지면 다음 동작을 허락할 것인지에 대한 여부
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드에 입력이 끝날 때 호출 (끝날지 말지를 처리)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(#function)
        print("입력 종료")
    }
    
    // Done 버튼 탭
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        // 응답자 제거
        textField.resignFirstResponder()    // 키보드가 내려감
    }
    
    // ViewController에 이미 있는 touchesBegan 메서드를 재정의(override)
    // 화면의 탭을 감지하는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // 1) 터치가 일어나면
        textField.resignFirstResponder()    // 2) 키보드를 내리겠다(키보드를 내리겠다)
        // self.view.endEditing(true)   // 뷰를 끝내겠다(키보드도 내려감)
    }
}

