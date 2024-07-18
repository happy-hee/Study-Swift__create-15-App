//
//  BMICalculatorManager.swift
//  BMI
//
//  Created by Nova on 7/17/24.
//

import UIKit

struct BMICalculatorManager {
    // 결과값 보관을 위한 변수
    var bmi: Double?

    // BMI 계산 메서드
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmi = round(bmiNumber * 10) / 10  // 반올림
    }
    
    // BMI 결과값
    func getBMIResult() -> Double {
        return bmi ?? 0.0
    }

    // BMI 값에 따라 색 얻는 메서드
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }

    // BMI 값에 따라 문자열 얻는 메서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비안"
        default:
            return ""
        }
    }

}
