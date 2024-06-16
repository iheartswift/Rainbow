//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//

import SwiftUI

/// A custom button style that applies a specific appearance and behavior when the button is pressed.
public struct RainbowButtonPressedStyle: ButtonStyle {
    
    // The configuration that determines the button's appearance, including its shape and theme.
    public var buttonConfiguration: RainbowButtonConfiguration
    
    /// Initializes the button style with the provided configuration and action.
    /// - Parameters:
    ///   - buttonConfiguration: The configuration object that defines the button's appearance and behavior.
    ///   - action: A closure that defines the action to be executed when the button is pressed.
    public init(buttonConfiguration: RainbowButtonConfiguration) {
        self.buttonConfiguration = buttonConfiguration
    }
    
    /// Constructs the button's body by applying the appropriate overlay and shape based on the button's configuration.
    /// It also executes the provided action when the button is pressed.
    /// - Parameter configuration: The configuration of the button, provided by SwiftUI.
    /// - Returns: A view representing the body of the button.
    public func makeBody(configuration: Self.Configuration) -> some View {
        switch buttonConfiguration.shapeType {
        case .circle:
            configuration.label
                .overlay(
                    configuration.isPressed ?
                    buttonConfiguration.theme.selected : Color.clear
                )
                .clipShape(Circle())
                .rainbowBounce(configuration: buttonConfiguration, isPressed: configuration.isPressed)
        case .roundedRectangle:
            configuration.label
                .overlay(
                    configuration.isPressed ?
                    buttonConfiguration.theme.selected : Color.clear
                )
                .clipShape(RoundedRectangle(cornerRadius: buttonConfiguration.cornerRadius))
                .rainbowBounce(configuration: buttonConfiguration, isPressed: configuration.isPressed)
        case .rectangle:
            configuration.label
                .overlay(
                    configuration.isPressed ?
                    buttonConfiguration.theme.selected : Color.clear
                )
                .clipShape(Rectangle())
                .rainbowBounce(configuration: buttonConfiguration, isPressed: configuration.isPressed)
        case .capsule:
            configuration.label
                .overlay(
                    configuration.isPressed ?
                    buttonConfiguration.theme.selected : Color.clear
                )
                .clipShape(Capsule())
                .rainbowBounce(configuration: buttonConfiguration, isPressed: configuration.isPressed)
        }
    }
}
