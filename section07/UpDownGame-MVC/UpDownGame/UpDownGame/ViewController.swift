//
//  ViewController.swift
//  UpDownGame
//
//  Created by Nova on 2024/06/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // comNumber 라는 이름으로 '클래스 내부'에 속성을 만듦
    var comNumber = Int.random(in: 1...10)
    // var myNumber: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) mainLabel text -> "Please select"
        mainLabel.text = "Please select!"
        
        // 2) numberLabel text -> ""
        numberLabel.text = ""
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 선택한 숫자 가져오기
        guard let numString = sender.currentTitle else { return }
    
        // 2) numberLabel 에 숫자 출력
        numberLabel.text = numString
    
        // 3) 선택한 숫자를 myNumber 에 할당(선택) ---> 문자열을 숫자로 변환하여 저장
        // guard let numInt = Int(numString) else { return }
        // myNumber = numInt
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) mainLabel text -> "Please select"
        mainLabel.text = "Please select!"
        // 2) 컴퓨터의 랜덤 숫자를 다르게
        comNumber = Int.random(in: 1...10)
        // 3) numberLabel -> ""
        numberLabel.text = ""
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // myNumber의 또다른 방법
        
        // 숫자 레이블에 있는 문자열 가져오기(옵셔널 벗기기)
        // guard let myNumStr = numberLabel.text else {return}
        
        // 타입 변환(String -> Int)
        // guard let myNumber = Int(myNumStr)else {return}
        
        // guard let 바인딩을 같이 쓰는 것도 가능
        guard let myNumStr = numberLabel.text,
              let myNumber = Int(myNumStr)else {return}

        
        // 컴퓨터의 숫자와 내가 선택한 숫자를 비교
        // -> mainLabel에 Up/Down/Bingo 출력
        if myNumber > comNumber {
            mainLabel.text = "Down"
        } else if myNumber < comNumber {
            mainLabel.text = "Up"
        } else {
            mainLabel.text = "Bingo😎"
        }
    }
    
}

