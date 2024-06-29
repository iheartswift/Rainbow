import SwiftUI

/// A view that represents the header section of a `RainbowCard`, which can contain a title, subtitle, and an optional button.
public struct RainbowCardHeader: View {
    
    /// The configuration for the header.
    let configuration: RainbowCardHeaderConfiguration
    
    /// The title of the header.
    let title: String
    
    /// The subtitle of the header.
    let subtitle: String?
    
    /// The icon for the button in the header.
    let buttonIcon: String?
    
    /// The title for the button in the header.
    let buttonTitle: String?
    
    /// The action to perform when the button is pressed.
    let buttonAction: (() -> Void)?
    
    /// Initializes a new instance of `RainbowCardHeader`.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the header. Default is `RainbowCardHeaderConfiguration()`.
    ///   - title: The title of the header.
    ///   - subtitle: The subtitle of the header. Default is `nil`.
    ///   - buttonIcon: The icon for the button in the header. Default is `nil`.
    ///   - buttonTitle: The title for the button in the header. Default is `nil`.
    ///   - buttonAction: The action to perform when the button is pressed. Default is `nil`.
    public init(
        configuration: RainbowCardHeaderConfiguration = RainbowCardHeaderConfiguration(),
        title: String,
        subtitle: String? = nil,
        buttonIcon: String? = nil,
        buttonTitle: String? = nil,
        buttonAction: (() -> Void)? = nil
    ) {
        self.configuration = configuration
        self.title = title
        self.subtitle = subtitle
        self.buttonIcon = buttonIcon
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }
    
    /// The body of the header view.
    public var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(configuration.titleFont)
                        .foregroundColor(configuration.titleColor)
                        .padding(configuration.titlePadding)
                    Spacer()
                }
                if let subtitle = subtitle {
                    HStack {
                        Text(subtitle)
                            .font(configuration.subtitleFont)
                            .foregroundColor(configuration.subtitleColor)
                            .padding(configuration.subtitlePadding)
                        Spacer()
                    }
                }
                Spacer()
            }
            Spacer()
            
            if let action = buttonAction {
                
                if let buttonIcon = buttonIcon, buttonTitle == nil {
                    VStack {
                        RainbowButton(action: action, Image(systemName: buttonIcon), configuration.buttonConfiguration)
                        Spacer()
                    }
                }
                
                else if let buttonIcon = buttonIcon, let buttonTitle = buttonTitle {
                    VStack {
                        RainbowButton(action: action, HStack {
                            Image(systemName: buttonIcon)
                            Text(buttonTitle)
                        }, configuration.buttonConfiguration)
                        Spacer()
                    }
                }
                
                else if let buttonTitle = buttonTitle {
                    VStack {
                        RainbowButton(action: action, Text(buttonTitle), configuration.buttonConfiguration)
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .frame(maxHeight: configuration.maxHeight)
    }
}
