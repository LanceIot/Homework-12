//
//  PlacesViewController.swift
//  MovieAppProject
//
//  Created by Админ on 25.01.2023.
//

import UIKit

class PlacesViewController: UIViewController {
    
    private let cinemaImages: [String] = ["kinopark", "kinopark1", "kinopark2", "kinopark3", "kinopark1", "kinopark2",]
    private let cinemaTitles: [String] = ["Cinemax Dostyk Multiplex", "Lumiera Cinema (ЦУМ)", "Kinoforum 10 (ТРЦ Forum)", "Kinopark 10 (Есентай) IMAX", "Chaplin MEGA Alma-Ata (ул. Розыбакиева 247А)", "Chaplin MEGA Park (ул. Макатаева)",]
    private let cinemaAdress: [String] = ["Самал-2, д. 111, уг.ул. Жолдасбекова, ТРЦ Дотык Плаза", "пр. Абылай хана, 62, Арбат", "ул. Сейфуллина, 617, ТРЦ Forum Almaty, 5-й этаж", "пр. Аль-Фараби, 77/8, ТЦ  Esentai Mall", "Ул. Розыбакиева 247А, ТРЦ MEGA Alma-Ata", "ул. Макатаева, 127, 3-й этаж",]
    
    private let categoryList = Category.allCases
    
    // Creating Search Bar
    private lazy var movieSearchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search movies, series, tv shows"
        return searchBar
    }()
    
    // Creating Category Collection View
    private lazy var categoryCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
        
    }()
    
    //Creating Places Table View
    private lazy var placesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.placesTableViewCell)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        placesTableView.dataSource = self
        placesTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Collection view data source methods

extension PlacesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categoryList[indexPath.row].rawValue)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
}

//MARK: - Collection view delegate methods

extension PlacesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let label = UILabel()
        label.text = categoryList[indexPath.row].rawValue
        label.font = UIFont.systemFont(ofSize: 15)
        label.sizeToFit()
        return CGSize(width: label.frame.size.width + 30, height: collectionView.frame.size.height - 15)
    }
}


//End

//MARK: - Table view data source methods

extension PlacesViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.placesTableViewCell, for: indexPath) as! PlacesTableViewCell
        cell.setImage(with: cinemaImages[indexPath.row])
        cell.setTitle(with: cinemaTitles[indexPath.row])
        cell.setAdress(with: cinemaAdress[indexPath.row])
        return cell
    }
    
    
}

//MARK: - Table view delegate methods

extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

//MARK: - Setup views and constraints

private extension PlacesViewController {
    
    func setupViews() {
        view.addSubview(movieSearchBar)
        view.addSubview(categoryCollectionView)
        view.addSubview(placesTableView)
    }
    
    func setupConstraints() {
        movieSearchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
        placesTableView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
