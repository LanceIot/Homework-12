//
//  PopularTableViewCell.swift
//  MovieAppProject
//
//  Created by Админ on 04.02.2023.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    
    private lazy var popularCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        collectionView.layer.borderWidth = 1
        collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.popularCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Collection view Data source and Delegate methods

extension PopularTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.popularCollectionViewCell, for: indexPath) as! PopularCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

extension PopularTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.layer.frame.size.height
        return CGSize(width: height/1.75, height: height)
    }
}

//MARK: - Setup Views and Constraints methods

extension PopularTableViewCell {
    
    func setupViews() {
        contentView.addSubview(popularCollectionView)
    }
    
    func setupConstraints() {
        
        popularCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}
