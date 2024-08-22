//
//  MyTableViewCell.swift
//  MyTableViewCode
//
//  Created by Nova on 2024/08/20.
//

import UIKit

// 테이블 셀
final class MyTableViewCell: UITableViewCell {

    // 이미지
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 제목
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    // 설명
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    // 제목,설명 2개를 묶음
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        
        setConstraints()
    }
    
    // 스택뷰 설정
    func setupStackView() {
        // self.addSubView보다 self.contentView.addSubnview로 잡는게 더 정확
        self.contentView.addSubview(mainImageView)
        self.contentView.addSubview(stackView)

        // 스택뷰 위에 뷰들(제목, 설명) 올리기
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 오토레이아웃 관련 함수
    func setConstraints() {
        setMainImageViewConstraints()
        setMovieNameViewConstraints()
        setStackViewConstraints()
    }
    
    // 이미지
    func setMainImageViewConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            
            // self.leadingAnchor 로 잡는 것보다 self.contentView.leadingAnchor 로 잡는게 더 정확
            // -> cell은 기본뷰로 contentView 를 가지고있음
            mainImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    // 제목
    func setMovieNameViewConstraints() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    // 스택뷰
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor),
        ])
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
