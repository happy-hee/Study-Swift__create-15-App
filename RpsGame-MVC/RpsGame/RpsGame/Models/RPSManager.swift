//
//  RPSManager.swift
//  RpsGame
//
//  Created by Nova on 2024/07/18.
//

import Foundation

struct RPSManager {
    // 데이터 저장 위한 변수 (컴퓨터 선택/나의 선택)
    private var comChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    private var myChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> Rps {
        return Rps.ready
    }
    
    func getUserRPS() -> Rps {
        return myChoice
    }
    
    func getComputerRPS() -> Rps {
        return comChoice
    }
    
    mutating func userGetSelected(name: String) {
        switch name {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            myChoice = Rps.rock
        }
    }
    
    func getRpsResult() -> String {
        if myChoice == comChoice {
            return "비겼다"
        } else if myChoice == .rock && comChoice == .scissors {
            return "이겼다"
        } else if myChoice == .scissors && comChoice == .paper {
            return "이겼다"
        } else if myChoice == .paper && comChoice == .rock {
            return "이겼다"
        } else {
            return "졌다"
        }
    }
    
    mutating func allReset() {
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
        myChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
}
