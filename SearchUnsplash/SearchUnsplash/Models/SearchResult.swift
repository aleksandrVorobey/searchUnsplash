//
//  SearchResult.swift
//  SearchUnsplash
//
//  Created by Александр Воробей on 21.06.2021.
//

import Foundation

struct SearchResult: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
