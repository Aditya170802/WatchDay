//
//  APIService.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import Foundation
import Combine

class WatchmodeService {
    static let shared = WatchmodeService()
    private let apiKey = "" // Replace with your actual API key
    private let baseURL = "https://api.watchmode.com/v1"
    
    func fetchMediaItems(type: String) -> AnyPublisher<[MediaItem], Error> {
        let urlString = "\(baseURL)/list-titles?apiKey=\(apiKey)&types=\(type)"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MediaResponse.self, decoder: JSONDecoder())
            .map(\.titles)
            .eraseToAnyPublisher()
    }
    
    func fetchMediaDetail(id: Int) -> AnyPublisher<MediaDetail, Error> {
        let urlString = "\(baseURL)/title/\(id)/details/?apiKey=\(apiKey)&append_to_response=sources"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MediaDetail.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func fetchMoviesAndShows() -> AnyPublisher<(movies: [MediaItem], shows: [MediaItem]), Error> {
        return Publishers.Zip(
            fetchMediaItems(type: "movie"),
            fetchMediaItems(type: "tv_series")
        )
        .map { (movies, shows) in
            return (movies: movies, shows: shows)
        }
        .eraseToAnyPublisher()
    }
}

