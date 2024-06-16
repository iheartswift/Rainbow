//
//  RainbowStyleLoaderView.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/// A view representing a rainbow style loader.
///
/// This view displays a rainbow style loader, with the circle animated in a rotating manner.
struct RainbowStyleLoaderView: View {
    /// The configuration for the loader.
    let configuration: RainbowButtonConfiguration
    
    /// A state variable indicating whether the loader is animating.
    @State private var isAnimating: Bool = false
    
    /// The body of the view.
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.6)
            .stroke(
                AngularGradient(
                    gradient: .init(
                        colors: colors
                    ),
                    center: .center
                ),
                style: StrokeStyle(lineWidth: 4, lineCap: .round)
            )
            .frame(
                width: configuration.size.suggestedHeight,
                height: configuration.size.suggestedHeight
            )
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(
                .linear(duration: 1.0)
                    .repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                withAnimation {
                    self.isAnimating = true
                }
            }
    }
    
    /// The colors to be used in the loader.
    @ViewBuilder
    var colors: [Color] {
        if let contentGradient = configuration.contentGradient {
            return contentGradient.colors
        } else {
            return [configuration.theme.foreground.opacity(0.5), configuration.theme.foreground]
        }
    }
}
