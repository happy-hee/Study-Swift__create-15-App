//
//  ViewController.swift
//  LoginProject
//
//  Created by 김다희 on 7/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 메모리에 올림
    let emailTextFieldView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }

    func makeUI() {
        // 화면에 표시
        view.addSubview(emailTextFieldView)
        
        emailTextFieldView.backgroundColor = UIColor.darkGray
        
        // 오토 레이아웃 잡기
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        // 왼쪽으로부터 얼마나 떨어지는지
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        // 오른쪽으로부터 얼마나 떨어지는지
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        // 위로부터 얼마나 떨어지는지
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        // 높이
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

