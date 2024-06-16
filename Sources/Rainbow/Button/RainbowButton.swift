import SwiftUI

/// A custom button view that applies a rainbow style with configurable options.
///
/// The `RainbowButton` view allows for custom content, configuration, and actions.
/// It also supports a loading state to show a loading indicator when necessary.
public struct RainbowButton<Content: View>: View {
    /// The content of the button.
    let content: Content
    
    /// The configuration for the button.
    let configuration: RainbowButtonConfiguration
    
    /// The action to perform when the button is pressed.
    let action: () -> Void
    
    /// A binding to a Boolean indicating whether the button is loading.
    @Binding var isLoading: Bool

    /// State to track focus on tvOS
    #if os(tvOS)
    @FocusState private var isFocused: Bool
    #endif

    /// Initializes a new instance of `RainbowButton`.
    ///
    /// - Parameters:
    ///   - action: The action to perform when the button is pressed.
    ///   - content: The content of the button.
    ///   - configuration: The configuration for the button. Default is `RainbowButtonConfigurationBuilder().build()`.
    ///   - isLoading: A binding to a Boolean indicating whether the button is loading. Default is `.constant(false)`.
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

    /// The body of the button view.
    public var body: some View {
        return Button(action: self.action) {
            content
                .modifier(RainbowButtonStyleModifier(
                    configuration: configuration,
                    isLoading: $isLoading
                ))
        }
        #if os(tvOS)
        .buttonStyle(RainbowCardButtonFocusedStyle(buttonConfiguration: configuration, isFocused: isFocused))
        .focused($isFocused)
        #else
        .buttonStyle(RainbowButtonPressedStyle(buttonConfiguration: configuration))
        #endif
    }
}
