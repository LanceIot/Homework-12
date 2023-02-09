import Foundation

protocol APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel])
    func didFailWithError(_ error: Error)
}

struct APICaller {
    
    var delegate: APICallerDelegate?
    
    func fetchRequest() {
        for urlString in Constants.Values.urlList {
            guard let url = URL(string: urlString) else { fatalError("Incorrect link!") }
            let task = URLSession.shared.dataTask(with: url) { data, _ , error in
                if let data, error == nil {
                    if let movieList = parseJSON(data) {
                        print(movieList[0].title)
                        delegate?.didUpdateMovieList(with: movieList)
                    } else {
                        delegate?.didFailWithError(error!)
                    }
                } else {
                    delegate?.didFailWithError(error!)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> [MovieModel]? {
        var movieList: [MovieModel] = []
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: data)
            for model in decodedData.results {
                if let backdropPath = model.backdrop_path {
                    let movieModel = MovieModel(adult: model.adult, backdropPath: backdropPath, id: model.id, title: model.title, description: model.overview, posterPath: model.poster_path, genreIds: model.genre_ids, releaseDate: model.release_date, voteAverage: model.vote_average)
                    movieList.append(movieModel)
                }
            }
        } catch {
            print(error)
            return nil
        }
        return movieList
    }
}
