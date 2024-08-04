//
//  FirstViewController.swift
//  MyN&TProject
//
//  Created by Nova on 2024/08/01.
//

import UIKit

class FirstViewController: UIViewController {

    // 로그인 여부에 따라 참/거짓 저장
    var isLogiIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    // 다음화면을 띄우는 시점(뷰가 화면에 나타난 직후 실행(뷰를 먼저 띄우고 -> 로그인이 되더있지 않다면 로그인화면 띄우기)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isLogiIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
    }

    
    func makeUI() {
        view.backgroundColor = .gray
        
        // 네비게이션바 설정
        let appearance = UINavigationBarAppearance()
        // appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .brown // 색상 설정
        appearance.configureWithTransparentBackground() // 투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
    }
    
}
