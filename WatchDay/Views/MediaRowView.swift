//
//  MediaRowView.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import SwiftUI

struct MediaRowView: View {
    let item: MediaItem
    
    var body: some View {
        HStack {
            Image(systemName: "movieclapper")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
                .padding(.trailing, 8)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                
                Text(item.type == "movie" ? "Movie" : "TV Show")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

