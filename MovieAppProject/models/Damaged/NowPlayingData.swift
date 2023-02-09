import Foundation

struct NowPlayingData: Decodable {
    let results: [NowPlayingResults]
}

struct NowPlayingResults: Decodable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let overview: String
    let poster_path: String
    let release_date: String
    let title: String
    let vote_average: Double
}

