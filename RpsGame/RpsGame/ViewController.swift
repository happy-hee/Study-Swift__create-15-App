//
//  ViewController.swift
//  RpsGame
//
//  Created by Novas on 2024/06/18.
//

import UIKit

// UIViewController 를 상속해서 개발자가 만든 ViewController 클래스
class ViewController: UIViewController {

    // 변수/속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImgView: UIImageView!
    @IBOutlet weak var myImgView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // Rps -> Rps.swift 파일에 만들어놓은 열거형(enum)
    var comChoice:Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice = Rps.rock
    
    // 함수/메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) 첫번째, 두번째 이미지뷰에 준비(묵)이미지가 표시
        comImgView.image = #imageLiteral(resourceName: "ready")
        myImgView.image = UIImage(named: "ready.png")
        
        // 2) 첫번째, 두번째 레이블에 준비 텍스트 표시
        comChoiceLabel.text = "Ready"
        myChoiceLabel.text = "Ready"
    }


    // 어떤 버튼을 눌렀는지가 sender 부분에 파라미터로 들어온다(Type: UIButton)
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 1) 가위/바위/보(enum) 를 선택해서 그 정보를 저장 ⭐️
        
        // 2) 버튼의 문자를 가져옴
        // currentTitle: 현재 타이틀을 '옵셔널'로 가져옴 (빈 문자열일 수도 있기때문에 옵셔널)
        // "가위", "바위", "보" -> 옵셔널로 가져오기 때문에 강제로 벗기거나 guard let 방식으로 벗김
        guard let title = sender.currentTitle else { return }
        
        // 3) 가져온 문자열을 분기화해서 myChoice 변수에 열거형으로 저장
        // title이 문자열이기 때문에 default가 필요
        switch title {
        case "Rock":
            myChoice = Rps.scissors
        case "Scissors":
            myChoice = Rps.rock
        case "Paper":
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 랜덤 선택한 값을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 값을 레이블에 문자열로 표시
        
        // comChoice가 enum 타입이기 때문에 default 불필요
        switch comChoice {
        case Rps.rock:
            comImgView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "Rock"
        case Rps.scissors:
            comImgView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "Scissors"
        case Rps.paper:
            comImgView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "Paper"

        }
        
        
        // 3) 내가 선택한 값을 이미지뷰에 표시
        // 4) 내가 선태한 값을 레이블에 문자열로 표시
        switch myChoice {
        case Rps.rock:
            myImgView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "Rock"
        case Rps.scissors:
            myImgView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "Scissors"
        case Rps.paper:
            myImgView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "Paper"

        }
        
        // 5) 메인 레이블에 컴퓨터가 선택한 값과 내가 선택한 값을 비교해서 이겼는지 졌는지를 판단 후 표시
        if myChoice == comChoice {
            mainLabel.text = "Draw"
        } else if myChoice == .rock && comChoice == .scissors {
            mainLabel.text = "Win!"
        } else if myChoice == .scissors && comChoice == .paper {
            mainLabel.text = "Win!"
        } else if myChoice == .paper && comChoice == .rock {
            mainLabel.text = "Win!"
        } else {
            mainLabel.text = "Lose"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터 이미지뷰에 처음 준비 이미지 표시
        // 2) 컴퓨터 레이블에 준비 문자열로 표시
        comImgView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "Ready"
        
        // 3) 내 이미지뷰에 처음 준비 이미지 표시
        // 4) 내 레이블에 준비 문자열로 표시
        myImgView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "Ready"
        
        // 5) 메인 레이블에 선택하세요 문자열 표시
        mainLabel.text = "Select"
        
        // 6) 컴퓨터가 다시 랜덤 선택한 값을 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
    
    
}

