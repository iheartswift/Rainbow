//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//

import SwiftUI

public struct RainbowButton<Content: View>: View {
    let content: Content
    let configuration: RainbowButtonConfiguration
    let action: () -> Void
    @Binding var isLoading: Bool

    public init(
        action: @escaping () -> Void,
        content: Content,
        configuration: RainbowButtonConfiguration = RainbowButtonConfigurationBuilder().build(),
        isLoading: Binding<Bool> = .constant(false)
    ) {
        self.content = content
        self.action = action
        self.configuration = configuration
        self._isLoading = isLoading
    }

    public var body: some View {
        Button(action: self.action) {
            content
                .modifier(RainbowButtonStyleModifier(
                    configuration: configuration,
                    isLoading: $isLoading
                ))
        }
        .buttonStyle(RainbowButtonPressedStyle(buttonConfiguration: configuration))
    }
}
