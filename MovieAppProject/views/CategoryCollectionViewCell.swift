//
//  CategoryCollectionViewCell.swift
//  MovieAppProject
//
//  Created by Админ on 25.01.2023.
//

import UIKit
import SnapKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    private lazy var categoryNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        label.textAlignment = .center
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
        categoryNameLabel.text = text
    }
}

//MARK: - Setup views and constraints

private extension CategoryCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(categoryNameLabel)
    }
    
    func setupConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

