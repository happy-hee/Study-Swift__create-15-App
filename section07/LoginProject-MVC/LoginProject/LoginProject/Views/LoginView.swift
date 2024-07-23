//
//  LoginView.swift
//  LoginProject
//
//  Created by 김다희 on 7/18/24.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - 이메일을 입력하는 텍스트뷰
    private lazy var emailTextFieldView: UIView = { // {}() -> 클로저 실행문
        // 클로저의 실행문 내에서는 속성명을 간단하게 선언을 한다
        // => 어차피 return 해서 담을 거기 때문. 그래서 여기서도 그냥 view 라고 선언
        let view = UIView()
        // 배경색
        view.backgroundColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        // 모서리 둥글게
        view.layer.cornerRadius = 5;
        view.clipsToBounds = true;
        
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    // "이메일 또는 전화번호" 안내문구
    private let emailInfoLabel: UILabel = {
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
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    
    // MARK: - 비밀번호를 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.27, green: 0.27, blue: 0.27, alpha: 1)  // #colorLiteral()
        view.layer.cornerRadius = 5;
        view.clipsToBounds = true;
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
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
        tf.backgroundColor = #colorLiteral(red: 0.27, green: 0.27, blue: 0.27, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear // 배경색 투명
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true     // 비밀번호를 가리는 설정(ㅇㅇㅇㅇ으로)
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    // 패스워드에 "표시"버튼 - 비밀번호 가리기 기능
    lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.83, green: 0.83, blue: 0.83, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - 로그인버튼
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.27, green: 0.27, blue: 0.27, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false    // 버튼 동작 여부(활성화/비활성화)
        // button.addTarget(ViewController.self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    // 비밀번호 재설정 버튼
    lazy var passwordResetButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 3개의 각 텍스트필드 및 로그인 버튼의 높이 설정
    private let textViewHeight: CGFloat = 48

    // 오토레이아웃 향후 변경을 위한 변수(애니메이션)
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo:
        emailTextFieldView.centerYAnchor
    )
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo:
        passwordTextFieldView.centerYAnchor
    )

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error")
    }
    
    func setup() {
        backgroundColor = UIColor.black
        emailTextField.delegate = self       // 대리자 설정
        passwordTextField.delegate = self        // 대리자 설정
    }
    
    func addViews() {
        [stackView, passwordResetButton].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        emailInfoLabelConstraints()
        emailTextFieldConstraints()
        passwordInfoLabelConstraints()
        passwordTextFieldConstraints()
        passwordSecureButtonConstraints()
        stackViewConstraints()
        passwordResetButtonConstraints()
    }
    
    private func emailInfoLabelConstraints(){
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            emailInfoLabelCenterYConstraint,    // 오토레이아웃 변경을 위해 변수에 담아놓음
        ])
    }
    private func emailTextFieldConstraints(){
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
        ])
        
    }
    private func passwordInfoLabelConstraints(){
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            passwordInfoLabelCenterYConstraint,    // 오토레이아웃 변경을 위해 변수에 담아놓음
        ])
    }
    private func passwordTextFieldConstraints(){
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
        ])
    }
    private func passwordSecureButtonConstraints(){
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
        ])

    }
    private func stackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
        ])
    }
    private func passwordResetButtonConstraints(){
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    // MARK: - 텍이메일텍스트필드, 비밀번호 텍스트필드 두가지 다 채워져 있을때, 로그인 버튼 빨간색으로 변경
    @objc func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1{
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }

        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else {
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            return
        }

        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
    
    // MARK: - 비밀번호 표시 버튼 함수
    @objc private func passwordSecureModeSetting() {
//        print("표시 버튼이 눌렸습니다.")
        
        // .toggle() - 누를때마다 true/false 가 번갈아가면서 실행됨
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    // 입력폼 외의 화면을 누르면 키보드가 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}


// UITextFieldDelegate 프로토콜 채택(확장)
extension LoginView: UITextFieldDelegate {
    // 텍스트필드에 입력 시작시 실행 (시점)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트(위로 올라가도록)
            emailInfoLabelCenterYConstraint.constant = -13
        }

        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트(위로 올라가도록)
            passwordInfoLabelCenterYConstraint.constant = -13
        }

        // 애니메이션 효과
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }

    }

    // 텍스트필드의 입력이 실제 끝났을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {

        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.27, green: 0.27, blue: 0.27, alpha: 1)
            
            // 빈칸이면 원래대로 되돌리기
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토레이아웃 업데이트(되돌리기)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }

        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.27, green: 0.27, blue: 0.27, alpha: 1)

            // 빈칸이면 원래대로 되돌리기
            if passwordTextField.text == "" {
            
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
            // 오토레이아웃 업데이트(되돌리기)
            passwordInfoLabelCenterYConstraint.constant = 0
            }
        }

        // 애니메이션 효과
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }


    // 엔터 누르면 일단 키보드 내림
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
