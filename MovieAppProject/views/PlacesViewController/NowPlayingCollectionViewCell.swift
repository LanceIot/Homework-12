//
//  NowPlayingCollectionViewCell.swift
//  MovieAppProject
//
//  Created by Админ on 05.02.2023.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    private lazy var nowPlayingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Forest Gump")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var voteLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemOrange
        label.textColor = .white
        label.text = "★ 7.7"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var nowPlayingTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Black Panther: Wakanda Forever"
        label.textColor = .label
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        return label
    }()
    
    private lazy var nowPlayingGenreLabel: UILabel = {
       let label = UILabel()
        label.text = "Drama, Action, Sci-Fi"
        label.textColor = .systemGray2
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
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
    
    func configure(with posterPath: String, _ title: String, _ voteNum: Double) {
        guard let url = URL(string: "\(Constants.Links.image)\(posterPath)") else { fatalError("Incorrect link configure!")
        }
        DispatchQueue.main.async {
            self.nowPlayingImageView.kf.setImage(with: url)
            self.nowPlayingTitleLabel.text = title
            self.voteLabel.text = "★ \(voteNum)"
        }
    }
}

//MARK: - Setup Views and Constraints methods

extension NowPlayingCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(nowPlayingImageView)
        nowPlayingImageView.addSubview(voteLabel)
        contentView.addSubview(bottomView)
        bottomView.addSubview(nowPlayingTitleLabel)
        bottomView.addSubview(nowPlayingGenreLabel)
    }
    
    func setupConstraints() {
        
        nowPlayingImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        
        voteLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(nowPlayingImageView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        nowPlayingTitleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        nowPlayingGenreLabel.snp.makeConstraints { make in
            make.top.equalTo(nowPlayingTitleLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

