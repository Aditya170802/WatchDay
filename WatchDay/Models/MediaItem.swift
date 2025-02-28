//
//  MediaItem.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import Foundation

struct MediaItem: Identifiable, Decodable {
    let id: Int
    let title: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, type
    }
}
