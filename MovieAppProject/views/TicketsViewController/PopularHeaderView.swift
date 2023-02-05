//
//  PopularHeaderView.swift
//  MovieAppProject
//
//  Created by Админ on 05.02.2023.
//

import UIKit

class PopularHeaderView: UIView {
    
    private lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        categoryLabel.text = text
    }
}

//MARK: - Setup views and constraints

private extension PopularHeaderView {
    
    func setupViews() {
        addSubview(categoryLabel)
    }
    
    func setupConstraints() {
        
        categoryLabel.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }
}

