//
//  MovieCollectionViewCell.swift
//  MovieAppProject
//
//  Created by Админ on 01.02.2023.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    private lazy var wholeView = UIView()
    
    private lazy var posterImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "Wiplash")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var movieNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Wiplash: Last Hope For Galaxy"
        label.textColor = .label
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 17.5)
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var genresNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Musical, Drama, Thriller"
        label.textColor = .systemGray2
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15)
        label.sizeToFit()
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
    
    func configure(with model: MovieModel) {
        guard let url = URL(string: "\(Constants.Links.image)\(model.posterPath)") else {fatalError("Incorrect link to poster path!")}
        let stringGenres = model.genreIds.map{ String($0) }
        DispatchQueue.main.async {
            self.posterImageView.kf.setImage(with: url)
            self.movieNameLabel.text = model.title
            self.genresNameLabel.text = stringGenres.joined(separator: ", ")
        }
    }
    
}

//MARK: - Setup views and constraints

private extension MovieCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(wholeView)
        wholeView.addSubview(posterImageView)
        wholeView.addSubview(movieNameLabel)
        wholeView.addSubview(genresNameLabel)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        posterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        genresNameLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
