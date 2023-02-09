//
//  Constants.swift
//  MovieAppProject
//
//  Created by Админ on 25.01.2023.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let api = "4bf7b5f6aa96f4f873c8a01385c2a5f1"
    }
    
    struct Identifiers {
        //MovieViewController
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
        //PlacesViewController
        static let placesTableViewCell = "PlacesTableViewCell"
        static let nowPlayingCollectionViewCell = "NowPlayingCollectionViewCell"
        //TicketsViewController
        static let popularTableViewCell = "PopularTableViewCell"
        static let popularCollectionViewCell = "PopularCollectionViewCell"
    }
    
    struct Values {
        static let urlList = [URLs.trending, URLs.nowPlaying, URLs.popular, URLs.topRated, URLs.upcoming]
    }
    
    struct Colors {
        
    }
    
    struct Links {
        static let api = "https://api.themoviedb.org/3/"
        
        static let image = "https://image.tmdb.org/t/p/w500/" // + poster path
    }
    
    struct URLs {
        static let trending = "\(Links.api)trending/movie/day?api_key=\(Keys.api)"
        static let nowPlaying = "\(Links.api)movie/now_playing?api_key=\(Keys.api)"
        static let popular = "\(Links.api)movie/popular?api_key=\(Keys.api)"
        static let topRated = "\(Links.api)movie/top_rated?api_key=\(Keys.api)"
        static let upcoming = "\(Links.api)movie/upcoming?api_key=\(Keys.api)"
    }
}

enum Category: String, CaseIterable {
    case nowPlaying = "🔥Now Playing"
    case popular = "🎬Popular"
    case topRated = "📺Top Rated"
    case upcoming = "🍿Upcoming"
}
