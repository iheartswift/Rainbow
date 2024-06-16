//
//  RainbowLoaderView.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/// A view representing a loader.
///
/// This view displays a loader based on the specified loader type.
public struct RainbowLoaderView: View {
    /// The configuration for the loader.
    let configuration: RainbowButtonConfiguration
    
    /// The body of the view.
    public var body: some View {
        switch configuration.loaderType {
        case .rainbow:
            RainbowStyleLoaderView(configuration: configuration)
        case .pulsating:
            RainbowPulsatingLoaderView(configuration: configuration)
        case .rotatingSquare:
            RainbowRotatingSquareLoaderView(configuration: configuration)
        case .dots:
            RainbowDotsLoaderView(configuration: configuration)
        case .progress:
            ProgressView()
                .tint(configuration.theme.foreground)
        }
    }
}
