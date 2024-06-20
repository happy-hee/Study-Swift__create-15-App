//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nova on 2024/06/18.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!

    @IBOutlet weak var mainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "Hiru"
        mainLabel.backgroundColor = UIColor.yellow
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "Hi!"
        // mainLabel.backgroundColor = UIColor.yellow
        mainButton.backgroundColor = UIColor.yellow
        mainButton.setTitleColor(.black, for: .normal)
        
        mainButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        // mainLabel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        // mainLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // mainLabel.textAlignment = NSTextAlignment.right
    }
    
    
    
}

