//
//  MediaDetail.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import Foundation

struct MediaDetail: Identifiable, Decodable {
    let id: Int
    let title: String
    let plot_overview: String
    let release_date: String
    let poster: String
    let posterLarge: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, plot_overview, release_date, poster, posterLarge
    }
}
