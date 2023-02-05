import Foundation

protocol APICallerForNowPlayingDelegate {
    func didUpdateMovieList(with movieList: [NowPlayingModel])
    func didFailWithError(_ error: Error)
}

struct APICallerForNowPlaying {
    
    var delegate: APICallerForNowPlayingDelegate?
    
    func fetchRequest() {
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=4bf7b5f6aa96f4f873c8a01385c2a5f1&language=en-US&page=1"
        guard let url = URL(string: urlString) else { fatalError("Incorrect link!") }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            if let data, error == nil {
                if let movieList = parseJSON(data) {
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
    
    func parseJSON(_ data: Data) -> [NowPlayingModel]? {
        var movieList: [NowPlayingModel] = []
        do {
            let decodedData = try JSONDecoder().decode(NowPlayingData.self, from: data)
            for movie in decodedData.results {
                let movieModel = NowPlayingModel(adult: movie.adult, backdropPath: movie.backdrop_path, genreIds: movie.genre_ids, id: movie.id, description: movie.overview, posterPath: movie.poster_path, releaseDate: movie.release_date, title: movie.title, voteAverage: movie.vote_average)
                movieList.append(movieModel)
            }
        } catch {
            print(error)
            return nil
        }
        return movieList
    }
}
