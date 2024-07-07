import SwiftUI

/// A view modifier that applies a rainbow button style to a button.
///
/// This modifier applies a rainbow button style to a button, with a loading indicator and various customizable options.
struct RainbowButtonModifier: ViewModifier {
    /// The configuration for the rainbow button.
    let configuration: RainbowButtonConfiguration
    
    /// A binding to a Boolean indicating whether the button is loading.
    @Binding var isLoading: Bool
    
    /// The action to perform when the button is pressed.
    let action: () -> Void
    
    /// The color when the button is pressed.
    var pressedColor: Color = .blue // Set your preferred pressed color here
    
    /// The default color of the button.
    var defaultColor: Color = .gray // Set your preferred default color here
    
    #if os(tvOS)
    @FocusState private var isFocused: Bool
    #endif

    /// The content view to apply the modifier to.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: A view with the rainbow button style applied.
    func body(content: Content) -> some View {
        Button(action: executeAction) {
            content
                .rainbowButtonStyle(configuration: configuration, isLoading: $isLoading)
        }
        #if os(tvOS)
        .buttonStyle(RainbowCardButtonFocusedStyle(buttonConfiguration: configuration, isFocused: isFocused))
        .focused($isFocused)
        #else
        .buttonStyle(RainbowButtonPressedStyle(buttonConfiguration: configuration))
        #endif
    }
    
    /// Executes the action associated with the button press, including playing sound and triggering haptic feedback if configured.
    func executeAction() {
        if let sound = configuration.sound {
            sound.play()
        }
        if let haptic = configuration.haptic {
            haptic.trigger()
        }
        action()
    }
}

private extension View {
    
    /// Applies a rainbow button style to the view.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the rainbow button.
    ///   - isLoading: A binding to a Boolean indicating whether the button is loading.
    /// - Returns: A view with the rainbow button style applied.
    func rainbowButtonStyle(configuration: RainbowButtonConfiguration, isLoading: Binding<Bool>) -> some View {
        self.modifier(RainbowButtonStyleModifier(configuration: configuration, isLoading: isLoading))
    }
}

/// Extensions to the `View` type to provide rainbow button styling and capsule shaping.
public extension View {
    
    /// Applies a rainbow button style to the view.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the rainbow button.
    ///   - size: The size of the rainbow button. Default is `.normal`.
    ///   - inverted: A Boolean indicating whether the button theme should be inverted. Default is `false`.
    ///   - isLoading: A binding to a Boolean indicating whether the button is loading. Default is `false`.
    ///   - action: The action to perform when the button is pressed.
    /// - Returns: A view with the rainbow button style applied.
    func rainbowButton(
        _ configuration: RainbowButtonConfiguration = .default,
        isLoading: Binding<Bool> = .constant(false),
        _ action: @escaping () -> Void
    ) -> some View {
        return self.modifier(RainbowButtonModifier(configuration: configuration, isLoading: isLoading, action: action))
    }
}
