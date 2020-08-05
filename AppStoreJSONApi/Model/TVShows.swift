//
//  TVShows.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 18.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import Foundation


struct TVShows: Decodable {
    let feed: TVFeed
    
}

struct TVFeed: Decodable {
    let results: [TVResult]
}

struct TVResult: Decodable {
    let kind, artistName, artworkUrl100: String
}
