//
//  main.swift
//  RandomBingo
//
//  Created by Nova on 2024/06/20.
//

import Foundation

// 컴퓨터의 숫자 선택(랜덤)
var computerChoice = Int.random(in: 1...100)
// 나의 숫자 선택(일단은 0)
var myChoice = 0

// 조건에 따른 반복문 실행(while)
while true {
    var userInput = readLine()  // Type: String?
//
//    if let input = userInput {
//        if let number = Int(input) {
//            myChoice = number
//        }
//    }
//
    // 옵셔널 스트링을 벗기고, 숫자로 변환해서 다시 벗기기
//    if let input = userInput, let number = Int(input) {
//        myChoice = number
//    }

    guard let input = userInput, let number = Int(input) else {
        print("문제 발생")
        
        // 반복문이므로 break (함수일 경우 return)
        break   // 반복 종료
    }
    myChoice = number
    
    // print(myChoice);

    if computerChoice > myChoice {
        print("Up")
    } else if computerChoice < myChoice {
        print("Down")
    } else {
        print("Bingo!")
        break   // 반복문을 종료
    }
}
