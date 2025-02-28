//
//  MediaDetailView.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import SwiftUI

struct MediaDetailView: View {
    let mediaId: Int
    @StateObject private var viewModel = MediaDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if viewModel.isLoading {
                    LoadingView()
                } else if let mediaDetail = viewModel.mediaDetail {
                    AsyncImage(url: URL(string: mediaDetail.posterLarge)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                        case .failure:
                            Image(systemName: "film")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(mediaDetail.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Release Date: \(mediaDetail.release_date)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text("Description")
                            .font(.headline)
                            .padding(.top, 8)
                        
                        Text(mediaDetail.plot_overview)
                            .font(.body)
                            .lineLimit(nil)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $viewModel.showError) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.errorMessage ?? "Unknown error"),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            viewModel.loadDetail(id: mediaId)
        }
    }
}


