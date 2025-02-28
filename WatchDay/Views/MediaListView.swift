//
//  MediaListView.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import SwiftUI

struct MediaListView: View {
    let items: [MediaItem]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(items) { item in
                    NavigationLink(destination: MediaDetailView(mediaId: item.id)) {
                        MediaRowView(item: item)
                    }
                }
            }
            .padding()
        }
    }
}


