//
//  AppsGroup.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 17.04.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//

import Foundation


struct AppsGroup: Decodable {
    
    let feed: Feed
    
}

struct Feed: Decodable {
    
    let title: String
    let results: [FeedResult]
    
}

struct FeedResult: Decodable {
    
    let name, artistName, artworkUrl100 : String
    
}
