//
//  MyTableViewCell.swift
//  MemberList
//
//  Created by Nova on 8/8/24.
//

import UIKit

class MyTableViewCell: UITableViewCell {
  
  // MARK: - UI구현
  let mainImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let memberNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let addressLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let stackView: UIStackView = {
    let sv = UIStackView()
    sv.axis = .vertical
    sv.distribution = .fill
    sv.alignment = .fill
    sv.spacing = 5
    sv.translatesAutoresizingMaskIntoConstraints = false
    return sv
  }()
  
  // 상위에 지정 생성자와 필수 생성자가 있을 때 지정 생성자를 재정의해서 생성자를 구현하면
  // 반드시 상위에 있는 필수 생성자를 구현해줘야함
  
  // 지정 생성자 (지정생성자 재정의)
  // reuseIdentifier 부분에는 보통 reuseIdentifier 를 넣음
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    setupStackView()
  }
  
  // 스택뷰를 세팅해주는 함수
  func setupStackView() {
    self.addSubview(mainImageView)
  
    // 셀 위에 스택뷰 올리기
    self.addSubview(stackView)
    
    // 스택뷰 위에 뷰들 올리기
    stackView.addArrangedSubview(memberNameLabel)
    stackView.addArrangedSubview(addressLabel)
  }
  
  // 필수 생성자 (필수 생성자가 자동으로 상속되지 않음. 그래서 반드시 구현을 해줘야함)
  // Fix버튼을 누르면 아래 코드가 자동으로 생김(애플에서 지정해놓은 것이므로 그냥 사용하면 됨)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
// *** 기본으로 생성됐던 함수들 -> 스토리보드 없으 직접 UI를 코드로 짰기때문에 지워도 무관 ***
//  override func awakeFromNib() {  // ViewDidLoad 같은 함수
//    super.awakeFromNib()
//    // Initialization code
//  }
//
//  override func setSelected(_ selected: Bool, animated: Bool) {
//    super.setSelected(selected, animated: animated)
//
//    // Configure the view for the selected state
//  }
// ************************************************************************
  
  
  // MARK: - 오토레이아웃 세팅
  // 오토레이아웃 정하는 정확한 시점
  override func updateConstraints() {
    setConstraints()
    super.updateConstraints()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.mainImageView.clipsToBounds = true
    self.mainImageView.layer.cornerRadius = self.mainImageView.frame.width / 2
  }
  
  func setConstraints() {
    NSLayoutConstraint.activate([
      mainImageView.heightAnchor.constraint(equalToConstant: 40),
      mainImageView.widthAnchor.constraint(equalToConstant: 40),
      mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
      mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      memberNameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
    
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 20),
      stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
    ])
  }
  
}
