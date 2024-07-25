//
//  ViewController.swift
//  TableView
//
//  Created by 김다희 on 7/23/24.
//

import UIKit

// 테이블뷰 사용 시 UITableViewDataSource 프로토콜 채택
class ViewController: UIViewController, UITableViewDataSource {

    

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self     // 대리자 설정

    }

    // 컨텐츠 표시 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

}

