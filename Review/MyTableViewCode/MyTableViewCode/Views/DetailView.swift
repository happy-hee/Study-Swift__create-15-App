//
//  DetailView.swift
//  MyTableViewCode
//
//  Created by Nova on 2024/08/22.
//

import UIKit

class DetailView: UIView {
    // 이미지
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // 제목
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    // 설명
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    // 이미지, 제목,설명 3개를 묶음
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 스택뷰 위에 뷰들 올리기
    func setupStackView() {
        stackView.addArrangedSubview(mainImageView)
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        // 뷰컨의 기본뷰 위에 스택뷰 올리기
        super.addSubview(stackView)
    }
    
    // 오토레이아웃 업데이트
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    
    func setConstraints() {
        setMainImageViewConstraints()
        setMovieNameLabelConstraints()
        setDescriptionLabelConstraints()
        setStackViewConstraints()
    }
    
    func setMainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 240),
            mainImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func setMovieNameLabelConstraints() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
