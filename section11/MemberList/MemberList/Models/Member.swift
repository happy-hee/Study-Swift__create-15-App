//
//  Member.swift
//  MemberList
//
//  Created by Nova on 8/5/24.
//

import UIKit

struct Member {
  
  lazy var memberImage: UIImage? = {
    // 이름이 없다면, 시스템 사람이미지 셋팅
    guard let name = name else {
      return UIImage(systemName: "person")
    }
    
    // 해당이름으로 된 이미지가 있다면 그 이미지 ?? 없다면 시스템 사람이미지 셋팅
    return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
  }()
  
  
  // 멤버의 절대석 순서를 위한 타입 저장 속성
  // :: 타입저장속성? 하나의 인스턴스에 속해있는게 아닌, 모든 인스턴스들이 공유할 수 있는 저장속성
  static var memberNumbers: Int = 0
  
  let memberId: Int
  let name: String?
  let age: Int?
  let phone: String?
  let address: String?
 
  
  // 구조체이기 때문에 생성자를 굳이 구현하지 않아도, 멤버와이즈 이니셜라이저가 자동으로 생성됨
  // :: 멤버와이즈 이니셜라이저? 생성자를 구현하지 않아도 가지고있는 모든 저장 속성을 하나하나 세팅할 수 있게 자동적으로 생성자를 제공해주는 문법
  
  //
  init(name: String?, age: Int?, phone: String?, address: String?) {
    // 타입저장속성을 활용한 ID값 주기
    self.memberId = Member.memberNumbers
    
    self.name = name
    self.age = age
    self.phone = phone
    self.address = address
    
    // 멤버를 생성한다면 항상 타입 저장속성의 정수값 + 1
    Member.memberNumbers += 1
  }
}
