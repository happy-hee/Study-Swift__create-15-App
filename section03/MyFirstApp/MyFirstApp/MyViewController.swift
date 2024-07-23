//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nova on 2024/06/18.
//

import UIKit

// ViewController: 애플이 미리 만들어놓은 템플릿(UIViewController 클래스를 상속받아서 만듦)
// 오른쪽클릭 -> Refactor 를 통해 이름을 바꿀 수 있다.
class MyViewController: UIViewController {

    // 속성: 클래스 내부에 있는 변수
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    
    // 앱의 화면에 들어오면 처음 실행하는 함수
    // override: 재정의하다
    // -> 상위 클래스(UIViewController)에서 정의되어있는 viewDidLoad 를 재정의
    override func viewDidLoad() {
        // viewDidLoad 함수를 재정의 할 때는 꼭
        // super.viewDidLoad()
        // 를 호출한다.
        super.viewDidLoad()
        
        mainLabel.text = "Hiru"
        
        // 레이블의 백그라운드 색상 설정
        // mainLabel.backgroundColor = UIColor.yellow
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

