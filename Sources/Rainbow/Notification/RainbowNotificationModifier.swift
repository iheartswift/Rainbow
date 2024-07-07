import SwiftUI

/// A view modifier that presents a rainbow-styled notification over a view.
public struct RainbowNotificationModifier: ViewModifier {
    /// A binding to control the visibility of the notification.
    @Binding var isPresented: Bool
    
    /// Configuration for the appearance and behavior of the notification.
    let configuration: RainbowNotificationConfiguration
    
    /// A Boolean value indicating whether to show the close button.
    let showCloseButton: Bool
    
    /// A Boolean value indicating whether the close button should adjust to the theme.
    let closeButtonAdjustToTheme: Bool
    
    /// An optional action to be executed when the close button is pressed.
    let closeButtonAction: (() -> Void)?
    
    /// Initializes a new instance of `RainbowNotificationModifier`.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the notification.
    ///   - isPresented: A binding to control the visibility of the notification.
    ///   - showCloseButton: A Boolean value indicating whether to show the close button. Defaults to `true`.
    ///   - closeButtonAdjustToTheme: A Boolean value indicating whether the close button should adjust to the theme. Defaults to `false`.
    ///   - closeButtonAction: An optional action to be executed when the close button is pressed. Defaults to `nil`.
    public init(
        configuration: RainbowNotificationConfiguration,
        isPresented: Binding<Bool> = .constant(false),
        showCloseButton: Bool = true,
        closeButtonAdjustToTheme: Bool = false,
        closeButtonAction: (() -> Void)? = nil
    ) {
        self.configuration = configuration
        self._isPresented = isPresented
        self.showCloseButton = showCloseButton
        self.closeButtonAdjustToTheme = closeButtonAdjustToTheme
        self.closeButtonAction = closeButtonAction
    }
    
    /// The body of the view modifier.
    ///
    /// - Parameter content: The content view to which the modifier is applied.
    /// - Returns: A view with the rainbow notification overlay.
    public func body(content: Content) -> some View {
        ZStack {
            if isPresented {
                RainbowNotification(
                    configuration: configuration,
                    isPresented: $isPresented,
                    showCloseButton: showCloseButton,
                    closeButtonAdjustToTheme: closeButtonAdjustToTheme,
                    closeButtonAction: closeButtonAction
                ) {
                    content
                }
            }
        }
    }
}

public extension View {
    
    /// Adds a rainbow-styled notification to the view.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the notification.
    ///   - isPresented: A binding to control the visibility of the notification.
    ///   - showCloseButton: A Boolean value indicating whether to show the close button. Defaults to `true`.
    ///   - closeButtonAdjustToTheme: A Boolean value indicating whether the close button should adjust to the theme. Defaults to `false`.
    ///   - closeButtonAction: An optional action to be executed when the close button is pressed. Defaults to `nil`.
    /// - Returns: A view with the rainbow notification overlay.
    func rainbowNotification(
        configuration: RainbowNotificationConfiguration,
        isPresented: Binding<Bool> = .constant(false),
        showCloseButton: Bool = true,
        closeButtonAdjustToTheme: Bool = false,
        closeButtonAction: (() -> Void)? = nil
    ) -> some View {
        self.modifier(RainbowNotificationModifier(
            configuration: configuration,
            isPresented: isPresented,
            showCloseButton: showCloseButton,
            closeButtonAdjustToTheme: closeButtonAdjustToTheme,
            closeButtonAction: closeButtonAction
        ))
    }
}
