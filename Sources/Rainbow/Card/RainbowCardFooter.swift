import SwiftUI

/// A view that represents the footer section of a `RainbowCard`, which can contain one or more buttons with configurable alignment and actions.
public struct RainbowCardFooter: View {
    
    /// The configuration for the footer.
    let configuration: RainbowCardFooterConfiguration

    /// Initializes a new instance of `RainbowCardFooter`.
    ///
    /// - Parameter configuration: The configuration for the footer.
    public init(configuration: RainbowCardFooterConfiguration) {
        self.configuration = configuration
    }

    /// The body of the footer view.
    public var body: some View {
        HStack {
            if configuration.buttons.count == 1 {
                switch configuration.alignment {
                case .left:
                    createButton(description: configuration.buttons[0])
                    Spacer()
                case .right:
                    Spacer()
                    createButton(description: configuration.buttons[0])
                default:
                    Spacer()
                    createButton(description: configuration.buttons[0])
                    Spacer()
                }
            } else if configuration.buttons.count == 2 {
                switch configuration.alignment {
                case .left:
                    createButton(description: configuration.buttons[0])
                    createButton(description: configuration.buttons[1])
                    Spacer()
                case .right:
                    Spacer()
                    createButton(description: configuration.buttons[0])
                    createButton(description: configuration.buttons[1])
                case .sides:
                    createButton(description: configuration.buttons[0])
                    Spacer()
                    createButton(description: configuration.buttons[1])
                default:
                    Spacer()
                    createButton(description: configuration.buttons[0])
                    Spacer()
                    createButton(description: configuration.buttons[1])
                    Spacer()
                }
            } else {
                ForEach(configuration.buttons.indices, id: \.self) { index in
                    Spacer()
                    createButton(description: configuration.buttons[index])
                }
                Spacer()
            }
        }
        .padding()
        .frame(maxHeight: configuration.maxHeight)
    }
    
    @ViewBuilder
    func content(description: RainbowCardFooterConfiguration.RainbowButtonDescription) -> some View {
        if let systemImage = description.systemImage, !systemImage.isEmpty {
            if let title = description.title, !title.isEmpty {
                HStack {
                    Image(systemName: systemImage)
                    Text(title)
                }
            } else {
                Image(systemName: systemImage)
            }
        } else if let title = description.title, !title.isEmpty {
            Text(title)
        } else {
            EmptyView()
        }
    }
    
    /// Creates a button with the specified description.
    ///
    /// - Parameter description: The description of the button, including configuration, optional system image, title, and action.
    /// - Returns: A view representing the button.
    private func createButton(description: RainbowCardFooterConfiguration.RainbowButtonDescription) -> some View {
        RainbowButton(action: description.action, content(description: description), description.configuration)
    }
}
