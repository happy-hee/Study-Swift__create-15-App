import UIKit

// 자격증(정의) - 텍스트필드 프로토콜
protocol RemoteControlDelegate {
    func channelUp()
    func channelDown()
}

// 리모콘 클래스(텍스트필드의 역할 - 직접적으로 유저와 커뮤니케이션)
class RemoteControl {
    // 대리자: RemoteControlDelegate 를 채택한 타입이면 성립
    var delegate: RemoteControlDelegate?
    
    func doSomething() {
        print("리모콘의 조작이 일어나고 있음")
    }
    
    func channelUp() {
        // delegate: 대리자
        // 대리자에게 동작을 전달
        delegate?.channelUp()
    }
    
    func channelDown() {
        delegate?.channelDown()
    }
 }

// TV 클래스(뷰컨트롤러의 역할 - 리모콘과 커뮤니케이션)
class TV: RemoteControlDelegate {
    
    func channelUp() {
        print("TV의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("TV의 채널이 내려간다.")
    }
}

let remote = RemoteControl()    // 객체 생성
let samsungTV = TV()    // TV 인스턴스 생성

remote.delegate = samsungTV // samsungTV를 대리자로 설정
// RemoteControl 의 var delegate: RemoteControlDelegate? 에서
// RemoteControlDelegate 부분에 samsungTV가 들어가는 거라고 생각하면 됨

remote.channelUp()  // 리모콘 실행 ===> delegate?.channelUp()
remote.channelDown()    // 리모콘 실행 ==> delegate?.channelDown()

/*
    [위 코드의 순서]
    1. RemoteControl() 객체를 생성해서 remote 변수에 할당
    2. TV 클래스의 인스턴스를 생성해서 samsungTV 변수에 할당
    3. samsungTV 인스턴스를 remote의 대리자로 설정
    4. remote.channelUp()을 실행하면, remote(RemoteControl)부분의
       var delegate 부분에 samsungTV가 할당됨
    5. delegate = samsungTV 이므로, samsungTV.channelUp() 이 실행됨
 */



// SmartPhone 클래스(뷰컨트롤러의 역할 - 리모콘과 커뮤니케이션)
class SmartPhone: RemoteControlDelegate {
    init(remote: RemoteControl) {
        remote.delegate = self
    }
    
    func channelUp() {
        print("스마트폰의 채널이 올라간다.")
    }
    
    func channelDown() {
        print("스마트폰의 채널이 내려간다.")
    }
}

let smartPhone = SmartPhone(remote: remote)

remote.channelUp()  // 리모콘 실행 ===> delegate?.channelUp()
remote.channelDown()    // 리모콘 실행 ==> delegate?.channelDown()
