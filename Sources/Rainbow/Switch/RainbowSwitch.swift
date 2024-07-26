import SwiftUI

// MARK: - RainbowSwitch

/// A customizable switch component that can be used as a toggle.
public struct RainbowSwitch: View {
    /// A binding to the switch's on/off state.
    @Binding var isOn: Bool
    /// The configuration for the switch.
    var configuration: RainbowSwitchConfiguration
    
    /// Initializes a new instance of RainbowSwitch.
    /// - Parameters:
    ///   - isOn: A binding to the switch's on/off state.
    ///   - configuration: The configuration for the switch.
    public init(isOn: Binding<Bool>, configuration: RainbowSwitchConfiguration) {
        self._isOn = isOn
        self.configuration = configuration
    }
    
    /// Creates the content and behavior of the `RainbowSwitch` view.
    public var body: some View {
        GeometryReader { geo in
            let handleGap = geo.size.height * 0.075
            ZStack(alignment: isOn ? .trailing : .leading) {
                if configuration.shapeType == .capsule {
                    Capsule()
                        .fill(isOn ? configuration.theme.onColor : configuration.theme.offColor)
                        .overlay(
                            Capsule()
                                .stroke(configuration.theme.switchBorderColor, lineWidth: 2)
                        )
                } else {
                    Rectangle()
                        .fill(isOn ? configuration.theme.onColor : configuration.theme.offColor)
                        .overlay(
                            Rectangle()
                                .stroke(configuration.theme.switchBorderColor, lineWidth: 2)
                        )
                }
                
                if configuration.shapeType == .capsule {
                    Capsule()
                        .fill(isOn ? configuration.theme.handleOnColor : configuration.theme.handleOffColor)
                        .padding(handleGap)
                        .frame(width: handleWidth(geo.size))
                        .shadow(color: configuration.shadowColor,
                                radius: handleGap * 0.5,
                                x: 0,
                                y: 0)
                        .overlay(
                            Capsule()
                                .stroke(configuration.theme.handleBorderColor, lineWidth: 2)
                        )
                } else {
                    Rectangle()
                        .fill(isOn ? configuration.theme.handleOnColor : configuration.theme.handleOffColor)
                        .padding(handleGap)
                        .frame(width: handleWidth(geo.size))
                        .shadow(color: configuration.shadowColor,
                                radius: handleGap * 0.5,
                                x: 0,
                                y: 0)
                        .overlay(
                            Rectangle()
                                .stroke(configuration.theme.handleBorderColor, lineWidth: 2)
                        )
                }
            }
            .frame(width: configuration.size.diameter * 2, height: configuration.size.diameter)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onEnded { _ in
                        withAnimation(configuration.animation) {
                            isOn.toggle()
                        }
                    }
            )
            .animation(configuration.animation, value: isOn)
        }
        .frame(width: configuration.size.diameter * 2, height: configuration.size.diameter) // Ensure the frame is set
    }
    
    private func handleWidth(_ size: CGSize) -> CGFloat {
        let w = size.width
        let h = size.height
        return isOn ? h + (w - h) * 0.3 : h
    }
}
