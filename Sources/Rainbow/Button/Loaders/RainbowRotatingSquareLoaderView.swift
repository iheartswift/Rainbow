//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A view representing a rotating square loader.
 
 This view displays a rotating square loader, with the square animated in a rotating manner.
 */
struct RainbowRotatingSquareLoaderView: View {
    /**
     The configuration for the loader.
     */
    let configuration: RainbowButtonConfiguration
    
    /**
     A state variable indicating whether the loader is animating.
     */
    @State private var isAnimating: Bool = false
    
    /**
     The body of the view.
     */
    var body: some View {
        rectangle
            .frame(width: configuration.size.suggestedHeight, height: configuration.size.suggestedHeight)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(
                Animation.linear(duration: 1.0)
                    .repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                self.isAnimating = true
            }
    }
    
    @ViewBuilder
    var rectangle: some View {
        if let contentGradient = configuration.contentGradient {
            Rectangle()
                .fill(AngularGradient(
                    gradient: .init(
                        colors: contentGradient.colors
                    ),
                    center: .center
                )
            )
        } else {
            Rectangle()
                .fill(configuration.theme.foreground)
        }
    }
}
