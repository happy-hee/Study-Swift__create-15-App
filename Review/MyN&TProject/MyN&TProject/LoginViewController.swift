//
//  LoginViewController.swift
//  MyN&TProject
//
//  Created by Nova on 2024/08/01.
//

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()

    }


    func makeUI() {
        view.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
 
    @objc func loginButtonTapped() {
        // 전화면의 isLogIn 속성에 접근하기
        if let presentingVC = presentingViewController {
            let tabBarCon = presentingVC as! UITabBarController
            let nav = tabBarCon.viewControllers?[0] as! UINavigationController
            let firstVC = nav.viewControllers[0] as! FirstViewController
            firstVC.isLogiIn = true
        }
        
        dismiss(animated: true, completion: nil)
    }
}
