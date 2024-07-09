//
//  ViewController.swift
//  LoginProject
//
//  Created by 김다희 on 7/6/24.
//

import UIKit

class ViewController: UIViewController {
 
    // MARK: - 이메일을 입력하는 텍스트뷰
    private lazy var emailTextFieldView: UIView = { // {}() -> 클로저 실행문
        // 클로저의 실행문 내에서는 속성명을 간단하게 선언을 한다
        // => 어차피 return 해서 담을 거기 때문. 그래서 여기서도 그냥 view 라고 선언
        let view = UIView()
        // 배경색
        view.backgroundColor = UIColor.darkGray
        // 모서리 둥글게
        view.layer.cornerRadius = 5;
        view.clipsToBounds = true;
        
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    // "이메일 또는 전화번호" 안내문구
    private var emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    // 로그인 - 이메일 입력 필드
    private lazy var emailTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear // 배경색 투명
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none   // 앞글자 자동 대문자 설정
        tf.autocorrectionType = .no     // 틀린 글자 자동으로 고쳐줌
        tf.spellCheckingType = .no      // 스펠링 체크
        tf.keyboardType = .emailAddress // 키보드 타입
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    
    // MARK: - 비밀번호를 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)  // #colorLiteral()
        view.layer.cornerRadius = 5;
        view.clipsToBounds = true;
//        view.addSubview(passwordTextField)
//        view.addSubview(passwordInfoLabel)
//        view.addSubview(passwordSecureButton)
        return view
    }()
    
    // "비밀번호" 안내문구
    private var passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white
        return label
    }()
    
    // 로그인 - 비밀번호 입력 필드
    private lazy var passwordTextField: UITextField = {
        var tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear // 배경색 투명
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true     // 비밀번호를 가리는 설정(ㅇㅇㅇㅇ으로)
        tf.clearsOnBeginEditing = false
//        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    // 패스워드에 "표시"버튼 - 비밀번호 가리기 기능
    private let passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.83, green: 0.83, blue: 0.83, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        // button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - 로그인버튼
    private let loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false    // 버튼 동작 여부(활성화/비활성화)
        return button
        
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }

    func makeUI() {
        view.addSubview(emailTextFieldView)
        // 오토 레이아웃 잡기
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor),
            
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2)
        ])
        

        
        

    }
}

