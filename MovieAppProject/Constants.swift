//
//  Constants.swift
//  MovieAppProject
//
//  Created by Админ on 25.01.2023.
//

import Foundation

struct Constants {
    
    struct Identifiers {
        //MovieViewController
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionViewCell"
        static let categoryTableViewCell = "CategoryTableViewCell"
        //PlacesViewController
        static let placesTableViewCell = "PlacesTableViewCell"
    }
    
    struct Values {

    }
    
    struct Colors {
        
    }
}

enum Category: String, CaseIterable {
    case all = "🔥All"
    case streaming = "🎬Streaming"
    case onTV = "📺On TV"
    case inTheaters = "🍿In Theaters"
}
