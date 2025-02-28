//
//  LoadingView.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 12) {
            ForEach(0..<6) { _ in
                LoadingRowView()
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

#Preview {
    LoadingView()
}
