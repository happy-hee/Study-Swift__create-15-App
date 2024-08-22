//
//  ViewController.swift
//  MyTableViewCode
//
//  Created by Nova on 2024/08/14.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView()
    
    // 테이블뷰의 데이터를 표시하기 위한 배열
    var moviesArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 (배열 관리 - 데이터)
    var movieDataManager = DataManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupNaviBar() // Navigation Bar Setting
        setupDatas()
        setupTableView()
        setupTableVewConstraints()
    }


    // 네비게이션바 설정(iOS버전 업데이트 되면서 바뀐 설정
    func setupNaviBar() {
        title = "영화 목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setupTableView() {
        // 델리게이트 패턴의 대리자 설정
        tableView.dataSource = self
        tableView.delegate = self
        // 셀의 높이 설정
        tableView.rowHeight = 120
        
        // 셀의 등록 과정 (직접 등록을 해야함 -> 스토리보드 사용시엔 스토리보드에서 자동등록됨)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func setupDatas() {
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    func setupTableVewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}


// ⭐️ 테이블뷰 사용 시 UITableViewDataSource 프로토콜 채택 - 두가지의 필수 메서드
extension ViewController: UITableViewDataSource {
    // 1) 컨텐츠 표시 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    // 2) 셀의 구성(데이터)을 뷰컨트롤러에게 물어봄음.
    // indexPath: 뷰를 구성할때의 섹션과 몇번째 행인지의 정보를 가지고있음
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // dequeueReusableCell: 힙에 올라간 재사용 가능한 셀을 꺼내서 사용하는 메서드
        // (사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
        // let cell = tableView.dequeueReusableCell(withIdentifier: "해당 셀의 Identifier", for: indexPath) as! 셀이름
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
        // -> 타입캐스팅 전: UITableViewCell 타입
        // -> 타입캐스팅 후: MovieCell 타입
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        // cell.스타일 등 = 값
        // 예시:
        // cell.mainImageView.image = movieArray[indexPath.row].movieImage
        // cell.movieNameLabel.text = movieArray[indexPath.row].movieName
        // cell.descriptionLabel.text = movieArray[indexPath.row].movieDescription
        // cell.selectionStyle = .none     // 셀 선택시 스타일(.none: 없음) / 또는 스토리보드에서 테이블 뷰 선택 후 selection 부분을 No Selection으로 선택

        return cell
    }
}


extension ViewController: UITableViewDelegate {
    // 셀이 선택되었을 때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 다음화면으로 이동
        let detailVC = DetailViewController()
        detailVC.movieData = moviesArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
