//
//  ViewController.swift
//  MyLoginView
//
//  Created by Nova on 2024/07/31.
//

import UIKit

class ViewController: UIViewController {

    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print()
        setupAddTarget()
    }

    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼을 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        print("다음 화면으로 넘어가기")
    }
    
    // 리셋버튼이 눌리면 동작하는 함수
    @objc func resetButtonTapped() {
        // 얼럿 만들기
        let alert = UIAlertController(title: "비밀번호 변경", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default){ action in print("확인버튼이 눌렸습니다")}
        
        let cancel = UIAlertAction(title: "취소", style: .cancel){ cancel in print("취소버튼이 눌렸습니다")}
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        present(alert, animated: true, completion: nil)
    }
}

