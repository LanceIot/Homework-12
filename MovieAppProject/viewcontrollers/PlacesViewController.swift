import UIKit

class PlacesViewController: UIViewController {
    
    var apiCallerForNowPlaying = APICallerForNowPlaying()
    var movieList: [NowPlayingModel] = []
        
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

//MARK: - Table view data source methods

extension PlacesViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.placesTableViewCell, for: indexPath) as! PlacesTableViewCell
        return cell
    }
    
    
}

//MARK: - Table view delegate methods

extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height
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
            make.height.equalTo(view).multipliedBy(0.06)
        }
        
        movieSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(view).multipliedBy(0.06)
        }
        
        placesTableView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
