//
//  Rps.swift
//  RpsGame
//
//  Created by Nova on 2024/06/19.
//

import Foundation

// [열거형]
// 셀 수 있는 한정된 갯수의 케이스들을 모아서 개발자가 만든 타입
// 원시값(raw value) 사용을 위해 타입(Int)을 붙임
// => Rps 열거형에 정수형으로 원시값을 넣음
enum Rps: Int {
    case rock   // 0
    case paper  // 1
    case scissors   // 2
}
