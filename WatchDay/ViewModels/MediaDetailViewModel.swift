//
//  MediaDetailViewModel.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import Foundation
import Combine

class MediaDetailViewModel: ObservableObject {
    @Published var mediaDetail: MediaDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showError = false
    
    private var cancellables = Set<AnyCancellable>()
    
    func loadDetail(id: Int) {
        isLoading = true
        
        WatchmodeService.shared.fetchMediaDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.isLoading = false
                    if case .failure(let error) = completion {
                        self?.errorMessage = error.localizedDescription
                        self?.showError = true
                    }
                },
                receiveValue: { [weak self] detail in
                    self?.mediaDetail = detail
                }
            )
            .store(in: &cancellables)
    }
}
