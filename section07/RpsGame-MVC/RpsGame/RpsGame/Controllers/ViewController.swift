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
    
    // 가위바위보 게임(비즈니스 로직) 관리를 위한 인스턴스
    var rpsManager = RPSManager()

    
    // 함수/메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    func configureUI() {

        // 1) 첫번째, 두번째 이미지뷰에 준비(묵)이미지가 표시
        comImgView.image = rpsManager.getReady().rpsInfo.image
        myImgView.image = rpsManager.getReady().rpsInfo.image
        
        // 2) 첫번째, 두번째 레이블에 준비 텍스트 표시
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
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
        rpsManager.userGetSelected(name: title)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 랜덤 선택한 값을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 값을 레이블에 문자열로 표시
        comImgView.image = rpsManager.getComputerRPS().rpsInfo.image
        comChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.name

        
        // 3) 내가 선택한 값을 이미지뷰에 표시
        // 4) 내가 선태한 값을 레이블에 문자열로 표시
        myImgView.image = rpsManager.getUserRPS().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRPS().rpsInfo.name

        
        // 5) 메인 레이블에 컴퓨터가 선택한 값과 내가 선택한 값을 비교해서 이겼는지 졌는지를 판단 후 표시
        mainLabel.text = rpsManager.getRpsResult()
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터 이미지뷰에 처음 준비 이미지 표시
        // 2) 컴퓨터 레이블에 준비 문자열로 표시
        comImgView.image = rpsManager.getReady().rpsInfo.image
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        // 3) 내 이미지뷰에 처음 준비 이미지 표시
        // 4) 내 레이블에 준비 문자열로 표시
        myImgView.image = rpsManager.getReady().rpsInfo.image
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        
        // 5) 메인 레이블에 선택하세요 문자열 표시
        mainLabel.text = "선택하세요"
        
        // 6) 컴퓨터가 다시 랜덤 선택한 값을 저장
        rpsManager.allReset()
    }
    
    
    
}

