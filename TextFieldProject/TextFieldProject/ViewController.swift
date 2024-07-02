//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Nova on 2024/06/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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


    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    
}

