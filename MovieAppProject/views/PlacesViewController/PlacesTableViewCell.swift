import UIKit

final class PlacesTableViewCell: UITableViewCell {
    
    var apiCallerForNowPlaying = APICallerForNowPlaying()
    var movieList: [NowPlayingModel] = []
    
    private lazy var nowPlayingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(NowPlayingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.nowPlayingCollectionViewCell)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        apiCallerForNowPlaying.delegate = self
        
        apiCallerForNowPlaying.fetchRequest()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - API Caller delegate methods

extension PlacesTableViewCell: APICallerForNowPlayingDelegate {
    func didUpdateMovieList(with movieList: [NowPlayingModel]) {
        self.movieList = movieList
    }
    
    func didFailWithError(_ error: Error) {
        print("Failed with error: ", error)
    }
}

//MARK: - Collection view Data source and Delegate methods

extension PlacesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.nowPlayingCollectionViewCell, for: indexPath) as! NowPlayingCollectionViewCell
        cell.configure(with: movieList[indexPath.item].posterPath, movieList[indexPath.item].title, movieList[indexPath.item].voteAverage)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

extension PlacesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 350)
    }
}

//MARK: - Setup views and constraints

private extension PlacesTableViewCell {
    
    func setupViews() {
        contentView.addSubview(nowPlayingCollectionView)
    }
    
    func setupConstraints() {
        nowPlayingCollectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
}

