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
    
    // Dice image Array
    // #imageLiteral()
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"),#imageLiteral(resourceName: "black2"),#imageLiteral(resourceName: "black3"),#imageLiteral(resourceName: "black4"),#imageLiteral(resourceName: "black5"),#imageLiteral(resourceName: "black6")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // firstImageView나 secondImageView는 UIImageView 타입
        // -> UIImageView의 미리 정의되어있는 이미지 속성(.image)에 이미지를 넣음(=)
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[1]
    }

    
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceArray.randomElement()
    }
    
    
}

