//
//  Constants.swift
//  MovieAppProject
//
//  Created by Админ on 25.01.2023.
//

import Foundation

struct Constants {
    
    struct Keys {
        static let apiKey = "4bf7b5f6aa96f4f873c8a01385c2a5f1"
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

    }
    
    struct Colors {
        
    }
    
    struct Links {
        static let apiUrl = "https://api.themoviedb.org/3/"
        static let imageUrl = "https://image.tmdb.org/t/p/w500/" // + poster path
    }
}

enum Category: String, CaseIterable {
    case all = "🔥All"
    case streaming = "🎬Streaming"
    case onTV = "📺On TV"
    case inTheaters = "🍿In Theaters"
}
