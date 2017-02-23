//
//  Movie.swift
//  MovieSearch
//
//  Created by Lawrence Herman on 2/14/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation


class Movie {
    
    let title: String
    let year: String
    
    init(dictionary: [String: Any]) {
        title = dictionary["Title"] as? String ?? "No Title"
        year = dictionary["Year"] as? String ?? "No Release Date"
        
    }
}
