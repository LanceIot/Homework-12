//
//  PlacesTableViewCell.swift
//  MovieAppProject
//
//  Created by Админ on 29.01.2023.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    
    //Creating Cinema Image View
    private lazy var cinemaImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ChaplinCinemas")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //Creating Left Content View
    private lazy var leftContentView = UIView()
    
    //Creating Cinema Name Label
    private lazy var cinemaNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Chaplin MEGA Park"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    //Creating Cinema Adress Label
    private lazy var cinemaAdressLabel: UILabel = {
        let label = UILabel()
        label.text = "Ул. Розыбакиева 247А, ТРЦ MEGA Alma-Ata"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    //Functions
    func setTitle(with text: String) {
        cinemaNameLabel.text = text
    }
    
    func setAdress(with text: String) {
        cinemaAdressLabel.text = text
    }
    
    func setImage(with name: String) {
        cinemaImage.image = UIImage(named: name)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Setup views and constraints

private extension PlacesTableViewCell {
    
    func setupViews() {
        contentView.addSubview(cinemaImage)
        contentView.addSubview(leftContentView)
        leftContentView.addSubview(cinemaNameLabel)
        leftContentView.addSubview(cinemaAdressLabel)
    }
    
    func setupConstraints() {
        cinemaImage.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.2)
        }
        
        leftContentView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(cinemaImage.snp.trailing).offset(10)
        }
        
        cinemaNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        cinemaAdressLabel.snp.makeConstraints { make in
            make.top.equalTo(cinemaNameLabel.snp.bottom).inset(5)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
}

