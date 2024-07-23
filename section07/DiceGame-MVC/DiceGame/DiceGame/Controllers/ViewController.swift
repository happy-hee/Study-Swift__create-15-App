//
//  ViewController.swift
//  DiceGame
//
//  Created by Nova on 2024/06/18.
//

import UIKit

class ViewController: UIViewController {

    // 스토리보드에서 연결한 속성
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    // 주사위 관련 비즈니스 로직을 다루는 인스턴스
    var diceManager = DiceManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // firstImageView나 secondImageView는 UIImageView 타입
        // -> UIImageView의 미리 정의되어있는 이미지 속성(.image)에 이미지를 넣음(=)
        firstImageView.image = diceManager.getFirstDice()
        secondImageView.image = diceManager.getFirstDice()
    }

    
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceManager.getRandomDice()
        
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceManager.getRandomDice()
    }
    
    
}

