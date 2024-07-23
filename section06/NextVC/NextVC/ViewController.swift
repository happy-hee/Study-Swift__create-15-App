//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        
        firstVC.someString = "아기상어"
        // 아래와 같은 방식으로는 사용하지 않음. 보통 위 방식처럼 변수를 만들고 그 변수에 담아서 사용
        // firstVC.mainLabel.text = "아기상어"
        
        // 화면 꽉차게
        firstVC.modalPresentationStyle = .fullScreen
        // 화면 전환
        present(firstVC, animated: true, completion: nil)
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동 -> 추천
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.someString = "아빠상어"
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    
    
    // 세그웨이를 잘 사용하지 않음 -> 필요시에만 복사해서 사용
    // 3-1) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toThirdVC", sender: self)
        
    }
    
    // 3-2) 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "엄마상어"
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "뚜루루뚜루"
        }
    }
    
    var num = 3
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if num > 5 {
            return false 
        } else {
            return true
        }
    }
}

