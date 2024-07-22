//
//  ViewController.swift
//  LoginProject
//
//  Created by 김다희 on 7/6/24.
//

import UIKit

final class ViewController: UIViewController  {
 
    private let loginView = LoginView()

    override func loadView() {
        view = loginView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 함수
    @objc func loginButtonTapped() {
        print("로그인 버튼이 눌렸습니다.")
    }
    
    
    // 비밀번호 리셋 버튼 함수
    @objc func resetButtonTapped() {
    //        print("리셋버튼이 눌렸습니다.")
        
        // 얼럿창 만들기
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인버튼이 눌렸습니다.")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소버튼이 눌렸습니다.")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        present(alert, animated: true, completion: nil)
    }
}

