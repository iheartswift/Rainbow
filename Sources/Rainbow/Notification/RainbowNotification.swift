import SwiftUI

/// A view that displays a customizable notification with optional close button functionality.
public struct RainbowNotification<Content: View>: View {
    
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
    
    /// The content of the notification.
    let content: Content
    
    /// Initializes a new instance of `RainbowNotification`.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the notification.
    ///   - isPresented: A binding to control the visibility of the notification.
    ///   - showCloseButton: A Boolean value indicating whether to show the close button. Defaults to `true`.
    ///   - closeButtonAdjustToTheme: A Boolean value indicating whether the close button should adjust to the theme. Defaults to `false`.
    ///   - closeButtonAction: An optional action to be executed when the close button is pressed. Defaults to `nil`.
    ///   - content: A closure that returns the content of the notification.
    public init(
        configuration: RainbowNotificationConfiguration,
        isPresented: Binding<Bool> = .constant(false),
        showCloseButton: Bool = true,
        closeButtonAdjustToTheme: Bool = false,
        closeButtonAction: (() -> Void)? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.configuration = configuration
        self._isPresented = isPresented
        self.showCloseButton = showCloseButton
        self.closeButtonAdjustToTheme = closeButtonAdjustToTheme
        self.closeButtonAction = closeButtonAction
        self.content = content()
    }
    
    public var body: some View {
        if isPresented {
            ZStack(alignment: .center) {
                notificationBackground
                notificationContent
                closeButton
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    /// The background view of the notification, styled according to the configuration.
    private var notificationBackground: some View {
        RoundedRectangle(cornerRadius: configuration.cornerRadius)
            .strokeBorder(
                LinearGradient(colors: configuration.borderOptions.colors, startPoint: .leading, endPoint: .trailing),
                style: StrokeStyle(lineWidth: configuration.borderOptions.width, dash: configuration.borderOptions.dashPattern)
            )
            .background(
                RoundedRectangle(cornerRadius: configuration.cornerRadius)
                    .foregroundColor(configuration.theme.background)
            )
            .shadow(color: configuration.shadowOptions.color, radius: configuration.shadowOptions.radius, x: configuration.shadowOptions.x, y: configuration.shadowOptions.y)
    }
    
    /// The content of the notification.
    private var notificationContent: some View {
        content
            .padding()
            .foregroundColor(configuration.theme.foreground)
            .font(configuration.font)
            .padding([.trailing], showCloseButton ? 10 : 0)
    }
    
    /// The close button view, if `showCloseButton` is `true`.
    private var closeButton: some View {
        VStack {
            HStack {
                Spacer()
                if showCloseButton {
                    Image(systemName: "xmark")
                        .rainbowButton(.configure(rainbowButtonConfiguration(from: configuration), .circle, .small)) {
                            withAnimation {
                                isPresented = false
                                closeButtonAction?()
                            }
                        }
                        .padding([.trailing], 5)
                        .padding([.top], 8)
                }
            }
            Spacer()
        }
    }
    
    /// Creates a `RainbowButtonConfiguration` for the close button based on the notification configuration.
    ///
    /// - Parameter configuration: The notification configuration.
    /// - Returns: A `RainbowButtonConfiguration` for the close button.
    public func rainbowButtonConfiguration(from configuration: RainbowNotificationConfiguration) -> RainbowButtonConfiguration {
        let buttonTheme = RainbowButtonColorTheme(from: configuration.theme)
        return RainbowButtonConfiguration(
            theme: closeButtonAdjustToTheme
                ? configuration.theme.background == .clear ? buttonTheme : buttonTheme.inverted()
                : RainbowButtonColorTheme(background: .black.opacity(0.6), foreground: .white)
        )
    }
}

public extension RainbowNotification where Content == Text {
    /// Initializes a new instance of `RainbowNotification` with text content.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the notification.
    ///   - isPresented: A binding to control the visibility of the notification.
    ///   - text: The text content of the notification.
    ///   - showCloseButton: A Boolean value indicating whether to show the close button. Defaults to `true`.
    ///   - closeButtonAction: An optional action to be executed when the close button is pressed. Defaults to `nil`.
    init(configuration: RainbowNotificationConfiguration, isPresented: Binding<Bool> = .constant(false), text: String, showCloseButton: Bool = true, closeButtonAdjustToTheme: Bool = false, closeButtonAction: (() -> Void)? = nil) {
        self.init(configuration: configuration, isPresented: isPresented, showCloseButton: showCloseButton, closeButtonAdjustToTheme: closeButtonAdjustToTheme, closeButtonAction: closeButtonAction) {
            Text(text)
        }
    }
}

