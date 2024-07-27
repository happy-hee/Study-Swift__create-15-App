//
//  ViewController.swift
//  TableView
//
//  Created by 김다희 on 7/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    // 영화 데이터
    var movieArray:[Movie] = []
    var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self     // 대리자 설정
        // tableView.rowHeight = 120       // 셀 높이

        movieDataManager.makeMovieData()
        movieArray = movieDataManager.getMovieData()     // 배열(데이터)을 전달받음
    }
}


// 테이블뷰 사용 시 UITableViewDataSource 프로토콜 채택
extension ViewController: UITableViewDataSource {
    // 컨텐츠 표시 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 타입캐스팅 전: UITableViewCell 타입
        // 타입캐스팅 후: MovieCell 타입
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        cell.mainImageView.image = movieArray[indexPath.row].movieImage
//        cell.movieNameLabel.text = movieArray[indexPath.row].movieName
//        cell.descriptionLabel.text = movieArray[indexPath.row].movieDescription
        
        let movie = movieArray[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        cell.selectionStyle = .none     // 셀 선택시 스타일(.none: 없음) / 또는 스토리보드에서 테이블 뷰 선택 후 selection 부분을 No Selection으로 선택
        
        return cell
    }
}
