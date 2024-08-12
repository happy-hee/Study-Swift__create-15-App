//
//  ViewController.swift
//  MemberList
//
//  Created by Nova on 8/5/24.
//

import UIKit

final class ViewController: UIViewController {
  
  // 테이블뷰
  private let tableView = UITableView()
  
  var memberListManager = MemberListManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupDatas()
    setupTableView()
    setupTableViewConstraints()
  }
  
  func setupTableView() {
    tableView.dataSource = self
    
    tableView.rowHeight = 60
  }
  
  
  func setupDatas() {
    memberListManager.makeMembersListDatas()

  }

  // 테이블뷰의 오토레이아웃
  func setupTableViewConstraints() {
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


extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return memberListManager.getMemberList().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  
}
