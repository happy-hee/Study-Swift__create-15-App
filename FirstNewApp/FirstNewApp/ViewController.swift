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
    // sender에 슬라이더가 들어옴
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 value값을 가지고 mainLabel의 텍스트를 세팅
        
        // 1) value값이 0~1로 되어있는걸 초로 바꾸기 위해 * 60을 함
        // 2) 너무 디테일한 값으로 되어있으므로 정수(Int) 형태로 변형
        number = Int(sender.value * 60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 타이머 중지
        timer?.invalidate()
        
        // timeInterval: 간격(초)
        // target: self -> ViewController 의 인스턴스를 가리킴
        // #selector: 선택자(실행할 함수)
        // userInfo 그냥 nil로 설정
        // repeats: 반복 여부
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfterOneSeconds), userInfo: nil, repeats: true)
        
//        // 클로저 내에서 객체의 속성 및 메서드에 접근 시에는 "self"키워드를 반드시 사용
          // 여기서 self 앞에 weak를 안 붙여도 됐던 이유 -> 위에서 Timer 변수를 만들 때 weak를 앞에 붙였으므로, 해당 인스턴스가 약하게 가르키고 있음. 그러므로 여기선 그냥 self 라고만 써서 사용 가능
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
//            [self] _ in
//            // 반복하고 싶은 코드
//
//            // 앞에서 [self] 를 작성해두면 self.number 이런식으로 작성하지 않아도 됨
//            if number > 0 {
//                number -= 1
//
//                // 슬라이더 줄어듦 (계산해서 넣어야함)
//                slider.value = Float(number)/Float(60)
//
//                // mainLabel 텍스트가 바뀜
//                mainLabel.text = "\(number) 초"
//            } else {
//                // number 값 초기화
//                number = 0
//                // mainLabel 텍스트
//                mainLabel.text = "알람!!!"
//
//                // 초가 0이 됐을 시 소리(시스템 소리)
//                AudioServicesPlaySystemSound(SystemSoundID(1000))
//
//                // 타이머 비활성화 (비활성화 하지 않으면 계속 1초 뒤 실행)
//                timer?.invalidate()
//            }
//        }
    }
    
    @objc func doSomethingAfterOneSeconds() {
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
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화
        timer?.invalidate() // 타이머 비활성화
        number = 0  // number 값 초기화
        mainLabel.text = "초를 선택하세요" // mainLabel 텍스트 초기화
        slider.value = 0.5  // 슬라이더 가운데 설정
    }
    
}

