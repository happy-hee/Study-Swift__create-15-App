//
//  ViewController.swift
//  FirstNewApp
//
//  Created by Nova on 2024/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    
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
        
        mainLabel.text = "\(seconds)"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지날 때마다 무언가를 실행
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 슬라이더 가운데 설정
        slider.value = 0.5
        // slider.setValue(0.5, animated: true)
    }
    
}

