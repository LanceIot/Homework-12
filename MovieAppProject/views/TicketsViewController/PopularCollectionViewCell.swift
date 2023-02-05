//
//  PopularCollectionViewCell.swift
//  MovieAppProject
//
//  Created by Админ on 05.02.2023.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    private lazy var popularImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Forest Gump")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup Views and Constraints methods

extension PopularCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(popularImageView)
    }
    
    func setupConstraints() {
        
        popularImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

