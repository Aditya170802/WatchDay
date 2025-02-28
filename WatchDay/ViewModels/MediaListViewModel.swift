//
//  MediaListViewModel.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import Foundation
import Combine

class MediaListViewModel: ObservableObject {
    @Published var movies: [MediaItem] = []
    @Published var shows: [MediaItem] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showError = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func loadData() {
        isLoading = true
        
        WatchmodeService.shared.fetchMoviesAndShows()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                        self?.showError = true
                    }
                },
                receiveValue: { [weak self] result in
                    self?.movies = result.movies
                    self?.shows = result.shows
                }
            )
            .store(in: &cancellables)
    }
}
