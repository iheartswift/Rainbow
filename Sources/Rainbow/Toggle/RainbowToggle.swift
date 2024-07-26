import SwiftUI

/// A customizable toggle component that can be used as a checkbox or radio button.
public struct RainbowToggle: View {
    
    var configuration: RainbowToggleConfiguration
    @Binding var isToggled: Bool
    
    public init(_ configuration: RainbowToggleConfiguration, isToggled: Binding<Bool>) {
        self.configuration = configuration
        self._isToggled = isToggled
    }

    @ViewBuilder
    private var shape: some View {
        switch configuration.shapeType {
        case .circle:
            Circle()
                .stroke(configuration.theme.borderColor, lineWidth: configuration.borderWidth)
                .background(
                    Circle()
                        .fill(isToggled ? configuration.theme.selectedBackgroundColor : configuration.theme.backgroundColor)
                )
                .animation(configuration.animation, value: isToggled)
        case .roundedRectangle(let cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius ?? configuration.borderWidth * 2)
                .stroke(configuration.theme.borderColor, lineWidth: configuration.borderWidth)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius ?? configuration.borderWidth * 2)
                        .fill(isToggled ? configuration.theme.selectedBackgroundColor : configuration.theme.backgroundColor)
                )
                .animation(configuration.animation, value: isToggled)
        case .rectangle:
            Rectangle()
                .stroke(configuration.theme.borderColor, lineWidth: configuration.borderWidth)
                .background(
                    Rectangle()
                        .fill(isToggled ? configuration.theme.selectedBackgroundColor : configuration.theme.backgroundColor)
                )
                .animation(configuration.animation, value: isToggled)
        case .capsule:
            Capsule()
                .stroke(configuration.theme.borderColor, lineWidth: configuration.borderWidth)
                .background(
                    Capsule()
                        .fill(isToggled ? configuration.theme.selectedBackgroundColor : configuration.theme.backgroundColor)
                )
                .animation(configuration.animation, value: isToggled)
        }
    }
    
    public var body: some View {
        ZStack {
            shape
            if isToggled {
                Image(systemName: configuration.imageSystemName)
                    .foregroundColor(configuration.theme.foregroundColor)
                    .transition(.scale)
                    .animation(configuration.animation, value: isToggled)
            }
        }
        .frame(width: configuration.size.diameter, height: configuration.size.diameter)
        .font(configuration.size.font)
        .contentShape(Rectangle()) // Ensure the entire area is tappable
        .onTapGesture {
            withAnimation(configuration.animation) {
                isToggled.toggle()
            }
        }
    }
}
