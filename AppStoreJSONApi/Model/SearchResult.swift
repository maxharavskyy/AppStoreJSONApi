//
//  SearchResult.swift
//  AppStoreJSONApi
//
//  Created by Макс Гаравський on 05.08.2020.
//  Copyright © 2020 Макс Гаравський. All rights reserved.
//


import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String // app icon
}
