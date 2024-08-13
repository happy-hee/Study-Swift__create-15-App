//
//  ViewController.swift
//  MyTableView
//
//  Created by Nova on 2024/08/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 테이블뷰의 데이터를 표시하기 위한 배열
    var moviesArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupDatas()
    }

    
    func setupTableView() {
        // 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 120
    }
    
    func setupDatas() {
        movieDataManager.makeMovieData()    // 일반적으로는 서버에 요청
        moviesArray = movieDataManager.getMovieData()   // 데이터 받아서 뷰컨의 배열에 저장
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()  // 데이터 업데이트(일반적으로는 서버에 요청, 여기선 임시 함수 사용)
        moviesArray = movieDataManager.getMovieData()   // 데이터가 업데이트 되었으므로 다시 데이터를 받아서 뷰컨의 배열에 저장
        tableView.reloadData()  // 테이블뷰 다시 불러오기
    }
    
}


extension ViewController: UITableViewDataSource {
    // 1) 테이블뷰의 몇개의 데이터를 표시할 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return moviesArray.count
    }
    
    // 2) 셀의 구성을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        // (힙에 올라간)재사용 가능한 셀을 꺼내서 사용하는 메서드 (애플이 미리 잘 만들어 놓음)
        // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
        // MyTableViewCell 부분의 클래스명은 MyTableViewCell, Identifier 이름은 MovieCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

// 델리게이트
extension ViewController: UITableViewDelegate {
    
    // 셀이 선택되었을 때(didSelectRowAt) 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 세그웨이를 실행
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    
    }
    
    // prepare 세그웨이(데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let index = sender as! IndexPath
            
            detailVC.movieData = moviesArray[index.row]
            
        }
    }
}

