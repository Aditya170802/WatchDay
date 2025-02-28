//
//  LoadingRowView.swift
//  WatchDay
//
//  Created by Aditya Ghuraiya on 28/02/25.
//

import SwiftUI

// MARK: - Shimmer Effect
struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: phase - 0.2),
                            .init(color: .white.opacity(0.3), location: phase), // Reduced opacity
                            .init(color: .clear, location: phase + 0.2)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(width: geometry.size.width * 1.5) // Wider gradient
                    .offset(x: -geometry.size.width * 0.5 + geometry.size.width * 1.5 * phase)
                    .mask(content)
                }
            )
            .onAppear {
                withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

struct LoadingRowView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
                .shimmering()
            
            VStack(alignment: .leading, spacing: 8) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 16)
                    .frame(maxWidth: .infinity)
                    .shimmering()
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 12)
                    .frame(maxWidth: .infinity)
                    .shimmering()
            }
            .padding(.leading, 8)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
extension View {
    func shimmering() -> some View {
        modifier(ShimmerModifier())
    }
}

#Preview {
    LoadingRowView()
}
