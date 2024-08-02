//
//  LoginView.swift
//  MyLoginView
//
//  Created by Nova on 2024/07/31.
//

import UIKit

class LoginView: UIView {
    // MARK: - 이메일 입력 텍스트뷰
    private lazy var emailTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        // 이메일 텍스트뷰 안에 입력필드
        view.addSubview(emailTextField)
        // 이메일 텍스트뷰 안에 레이블
        view.addSubview(emailInfoLabel)
        return view
    }()
    
    // 안내문구(이메일주소 또는 전화번호)
    private let emailInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    // 이메일/전화번호 입력 필드
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no // 틀린글자 자동고침
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // MARK: - 비밀번호 입력 텍스트뷰
    private lazy var passwordTextFieldView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        // 비밀번호 텍스트뷰 안 레이블
        view.addSubview(passwordInfoLabel)
        // 비밀번호 텍스트뷰 안 입력필드
        view.addSubview(passwordTextField)
        // 비밀번호 표시 버튼
        view.addSubview(passwordSecureButton)
        return view
    }()
    
    // 안내문구(비밀번호)
    private let passwordInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return label
    }()
    
    // 비밀번호 입력 필드
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no // 틀린글자 자동고침
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    // 패스워드에 "표시"버튼, 비밀번호 가리기 기능
    lazy var passwordSecureButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1) , for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - 로그인버튼
    lazy var loginButton: UIButton = {
        var button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        return button
    }()
    
    // 요소들을 스택뷰에 배치
    private lazy var stackView: UIStackView = {
       let stview = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    
    // MARK: - 비밀번호 재설정 버튼
    lazy var passwordResetButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    
    
    // 텍스트필드, 로그인버튼 높이 설정
    private let textViewHeight: CGFloat = 48
    
    // 오토레이아웃 애니메이션 변경을 위한 변수
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    // 코드로 UI 잡기
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addViews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 기본 설정
    func setup() {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // 화면에 서브뷰 표시하기
    func addViews() {
        [stackView, passwordResetButton].forEach { addSubview($0) }
    }
    
    // MARK: - 오토레이아웃 설정
    private func setConstraints(){
        emailInfoLabelConstraints()
        emailTextFieldConstraints()
        passwordInfoLabelConstraints()
        passwordTextFieldConstraints()
        passwordSecureButtonConstraints()
        stackViewConstraints()
        passwordResetButtonConstraints()
    }

    // 이메일 입력 레이블
    private func emailInfoLabelConstraints() {
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
            emailInfoLabelCenterYConstraint
        ])
    }
    
    // 이메일 입력 필드
    private func emailTextFieldConstraints() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15),
            emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2),
            emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8),
        ])
    }
    
    // 비밀번호 입력 레이블
    private func passwordInfoLabelConstraints(){
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            passwordInfoLabelCenterYConstraint
        ])
    }
    
    // 비밀번호 입력 필드
    private func passwordTextFieldConstraints(){
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
        ])
    }
    
    // 비밀번호 표시 버튼
    private func passwordSecureButtonConstraints() {
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8)
        ])
    }
    

    // 스택뷰
    private func stackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36)
        ])
    }
    
    // 비밀번호 재설정 버튼
    private func passwordResetButtonConstraints() {
        passwordResetButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordResetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordResetButton.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    // MARK: - 이메일, 비밀번호 텍스트필드 두가지 다 채워져 있을 때, 로그인 버튼 색상 변경
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        // 텍스트 글자가 1개인데 그게 공백인 경우 리턴
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        
        guard
            // emaiilTextField의 텍스트가 비어있지 않은 경우
            let email = emailTextField.text, !email.isEmpty,
            // passwordTextField의 텍스트가 비어있지 않은 경우
            let password = passwordTextField.text, !password.isEmpty
            // 두개의 조건문 -> 둘 다 텍스트가 비어있지 않은 경우
        else {  // 둘중 하나라도 비어있을 경우 실행
            loginButton.backgroundColor = .clear
            loginButton.isEnabled = false
            return
        }
        
        loginButton.backgroundColor = .red
        loginButton.isEnabled = true
    }
    
    @objc private func passwordSecureModeSetting() {
        // 클릭을 할 때마다 true/false 전환
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    // 화면 터치시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

extension LoginView: UITextFieldDelegate {
    // 텍스트필드 편집 시작 - 문구가 위로 올라가면서 크기 작아짐 / 오토레이아웃 업데이트
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // 이메일 텍스트필드를 누른 경우
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.3, green: 0.3, blue:0.3, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        // 비밀번호 텍스트필드를 누른경우
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.3, green: 0.3, blue:0.3, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        // 레이아웃 변경은 애니메이션으로
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    // 텍스트필드 편집 종료 - 백그라운드 색 변경 / 글자가 하나도 없으면 되돌리기
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 이메일 텍스트필드
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            // 빈칸이면 원래로 되돌리기
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        // 비밀번호 텍스트필드
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            // 빈칸이면 원래로 되돌리기
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        // 레이아웃 변경은 애니메이션으로
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }    
    
    // 엔터 누를시 키보드 내림
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
