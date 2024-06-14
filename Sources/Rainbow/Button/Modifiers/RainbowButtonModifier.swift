//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A view modifier that applies a rainbow button style to a button.
 
 This modifier applies a rainbow button style to a button, with a loading indicator and various customizable options.
 */
struct RainbowButtonModifier: ViewModifier {
    /**
     The configuration for the rainbow button.
     */
    let configuration: RainbowButtonConfiguration
    
    /**
     A binding to a Boolean indicating whether the button is loading.
     */
    @Binding var isLoading: Bool
    
    /**
     The action to perform when the button is pressed.
     */
    let action: () -> Void
    
    /**
     The content view to apply the modifier to.
     */
    func body(content: Content) -> some View {
        Button(action: action) {
            content
                .rainbowButtonStyle(configuration: configuration, isLoading: $isLoading)
        }
    }
}
