//
//  ViewController.swift
//  TableView
//
//  Created by 김다희 on 7/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 영화 데이터
    // 테이블뷰의 데이터를 표시하기 위한 배열
    var movieArray:[Movie] = []

    // MVC패턴을 위한 데이터 매니저(배열관리 - 데이터)
    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupDatas()
    }

    func setupTableView() {
        // 대리자 설정 - 2개의 속성이 기본적으로 들어간다고 보면 됨
        tableView.dataSource = self
        tableView.delegate = self
        // tableView.rowHeight = 120       // 셀 높이
    }

    func setupDatas() {
        movieDataManager.makeMovieData()
        movieArray = movieDataManager.getMovieData()     // 배열(데이터)을 전달받음
    }
}


// ⭐️ 테이블뷰 사용 시 UITableViewDataSource 프로토콜 채택
extension ViewController: UITableViewDataSource {
    // 1) 컨텐츠 표시 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    // 2) 셀의 구성(데이터)을 뷰컨트롤러에게 물어봄음.
    // indexPath: 뷰를 구성할때의 섹션과 몇번째 행인지의 정보를 가지고있음
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // 힙에 올라간 재사용 가능한 셀을 꺼내서 사용하는 메서드
        // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)

        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        // -> 타입캐스팅 전: UITableViewCell 타입
        // -> 타입캐스팅 후: MovieCell 타입
        
        let movie = movieArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none     // 셀 선택시 스타일(.none: 없음) / 또는 스토리보드에서 테이블 뷰 선택 후 selection 부분을 No Selection으로 선택
        
        
//        cell.mainImageView.image = movieArray[indexPath.row].movieImage
//        cell.movieNameLabel.text = movieArray[indexPath.row].movieName
//        cell.descriptionLabel.text = movieArray[indexPath.row].movieDescription

        return cell
    }
}

extension ViewController: UITableViewDelegate {

    // 셀이 선택이 됐을 때 어떤 동작을 할 것인지 '뷰컨트롤러'에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // withIdentifier: 대상
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    // ⭐️ 스토리보드를 통해서 데이터를 전달을 할 때는 항상 이 prepare 메서드를 사용
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            
            // 배열에서 아이템을 꺼내서 다음화면으로 전달
            detailVC.movieData = array[indexPath.row]
        }
    }
}
