//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Nova on 2024/06/24.
//

import UIKit
import AVFoundation // 시스템 소리를 내게 하기 위해 추가한 프레임워크

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 기본 설정
        configureUI()
    }

    
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        
        // 슬라이더 가운데 설정
        slider.value = 0.5  // value: 0~1
    }
    
    // slider가 변할 때마다 실행
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 value값을 가지고 mainLabel의 텍스트를 세팅
        
        // 1) value값이 0~1로 되어있는걸 초로 바꾸기 위해 * 60을 함
        // 2) 너무 디테일한 값으로 되어있으므로 정수(Int) 형태로 변형
        let seconds = Int(slider.value * 60)
        
        mainLabel.text = "\(seconds) 초"
        
        // number 변수에 초를 할당
        number = seconds
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지날 때마다 무언가를 실행
        timer?.invalidate()
        
        // withTimeInterval: 간격(초)
        // 클로저 내에서 객체의 속성 및 메서드에 접근 시에는 "self"키워드를 반드시 사용
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            [self] _ in
            // 반복하고 싶은 코드
            
            // 앞에서 [self] 를 작성해두면 self.number 이런식으로 작성하지 않아도 됨
            if number > 0 {
                number -= 1
                
                // 슬라이더 줄어듦 (계산해서 넣어야함)
                slider.value = Float(number)/Float(60)
                
                // mainLabel 텍스트가 바뀜
                mainLabel.text = "\(number) 초"
            } else {
                // number 값 초기화
                number = 0
                // mainLabel 텍스트
                mainLabel.text = "알람!!!"
                
                // 초가 0이 됐을 시 소리(시스템 소리)
                AudioServicesPlaySystemSound(SystemSoundID(1000))
                
                // 타이머 비활성화 (비활성화 하지 않으면 계속 1초 뒤 실행)
                timer?.invalidate()
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화
        timer?.invalidate() // 타이머 비활성화
        number = 0  // number 값 초기화
        mainLabel.text = "초를 선택하세요" // mainLabel 텍스트 초기화
        slider.value = 0.5  // 슬라이더 가운데 설정
    }
    
}

