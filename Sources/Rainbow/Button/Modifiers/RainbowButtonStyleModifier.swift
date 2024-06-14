//
//  RainbowButtonStyleModifier.swift
//
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A view modifier that applies a rainbow button style to a view.
 
 This modifier applies a rainbow button style to a view, with a loading indicator and various customizable options.
 */
struct RainbowButtonStyleModifier: ViewModifier {
    /**
     The configuration for the rainbow button.
     */
    let configuration: RainbowButtonConfiguration
    
    /**
     A binding to a Boolean indicating whether the button is loading.
     */
    @Binding var isLoading: Bool
    
    /**
     The content view to apply the modifier to.
     */
    func body(content: Content) -> some View {
        ZStack {
            content
                .opacity(isLoading ? 0.0 : 1.0)
            RainbowLoaderView(configuration: configuration, loaderType: .rainbow)
                .tint(configuration.theme.foreground)
                .opacity(isLoading ? 1.0 : 0.0)
        }
        .underline(configuration.underline, color: Color(UIColor.label))
        .font(configuration.size.font)
        .padding(configuration.size.padding)
        .foregroundColor(configuration.theme.foreground)
        .capsuleShape(
            useCapsuleShape: configuration.useCapsuleShape,
            backgroundColor: configuration.theme.background,
            borderColor: configuration.border.color,
            borderWidth: configuration.border.width
        )
        .shadow(color: configuration.shadow.color, radius: configuration.shadow.radius, x: configuration.shadow.x, y: configuration.shadow.y)
    }
}
