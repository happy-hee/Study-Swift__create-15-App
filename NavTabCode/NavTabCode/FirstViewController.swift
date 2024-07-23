//
//  FirstViewController.swift
//  NavTabCode
//
//  Created by Nova on 2024/07/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = .gray
        
        let navigationBarAppearange = UINavigationBarAppearance()
        navigationBarAppearange.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = navigationBarAppearange
        navigationController?.navigationBar.tintColor = .blue
        
        navigationItem.scrollEdgeAppearance = navigationBarAppearange
        navigationItem.standardAppearance = navigationBarAppearange
        navigationItem.compactAppearance = navigationBarAppearange
        
        navigationController?.setNeedsStatusBarAppearanceUpdate()
        
        navigationController?.navigationBar.isTranslucent = false
        title = "Main"
    }
}
