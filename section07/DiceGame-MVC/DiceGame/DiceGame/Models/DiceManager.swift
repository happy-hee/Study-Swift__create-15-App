//
//  DiceManager.swift
//  DiceGame
//
//  Created by Nova on 2024/07/18.
//

import UIKit

struct DiceManager {
    // Dice image Array
    private var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"),#imageLiteral(resourceName: "black2"),#imageLiteral(resourceName: "black3"),#imageLiteral(resourceName: "black4"),#imageLiteral(resourceName: "black5"),#imageLiteral(resourceName: "black6")]
    
    // 랜덤으로 주사위 가져오기
    func getRandomDice() ->UIImage {
        return diceArray.randomElement()!
    }
    
    func getFirstDice() -> UIImage {
        return diceArray[0]
    }
}
