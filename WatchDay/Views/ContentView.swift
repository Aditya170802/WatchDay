//
//  ContentView.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MediaListViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Media Type", selection: $selectedTab) {
                    Text("Movies").tag(0)
                    Text("TV Shows").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                if viewModel.isLoading {
                    LoadingView()
                } else {
                    if selectedTab == 0 {
                        MediaListView(items: viewModel.movies)
                    } else {
                        MediaListView(items: viewModel.shows)
                    }
                }
            }
            .navigationTitle("WatchDay")
            .alert(isPresented: $viewModel.showError) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.errorMessage ?? "Unknown error"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

#Preview{
    ContentView()
}
