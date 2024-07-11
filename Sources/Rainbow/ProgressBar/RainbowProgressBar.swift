import SwiftUI

/// A view that represents a progress bar with customizable configuration and appearance.
public struct RainbowProgressBar: View {
    
    /// The configuration for the progress bar.
    let configuration: RainbowProgressBarConfiguration
    
    /// The current progress value.
    @Binding var progress: Double
    
    /// State variable to track the animated border color index.
    @State private var animatedBorderColorIndex: Int = 0
    
    /// State variable to track the current border color.
    @State private var currentBorderColor: Color = .black
    
    /// Initializes a new instance of `RainbowProgressBar`.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the progress bar.
    ///   - progress: A binding to the current progress value.
    public init(
        _ configuration: RainbowProgressBarConfiguration,
        _ progress: Binding<Double>
    ) {
        self.configuration = configuration
        self._progress = progress
    }
    
    /// The body of the progress bar view.
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                // Background
                progressShape(isBackground: true)
                    .frame(width: geometry.size.width)
                
                // Foreground progress without border
                progressShape(isBackground: false)
                    .if(hasBorder, transform: { view in
                        view
                            .frame(width: max(geometry.size.width * progress - configuration.border.width * 2, 0))
                            .frame(height: max(geometry.size.height - configuration.border.width * 2, 0))
                            .offset(x: configuration.border.width)
                    })
                    .if(!hasBorder, transform: { view in
                        view.frame(width: geometry.size.width * progress)
                    })
                    .animation(configuration.animation, value: progress)
            }
        }
        .onAppear {
            startBorderAnimation()
        }
    }
    
    /// Determines whether the progress bar has a border.
    private var hasBorder: Bool {
        configuration.border.width > 0
    }
    
    /// Creates the shape of the progress bar based on the configuration.
    ///
    /// - Parameter isBackground: A Boolean indicating whether the shape is for the background.
    /// - Returns: A view representing the shape of the progress bar.
    @ViewBuilder
    private func progressShape(isBackground: Bool) -> some View {
        switch configuration.shapeType {
        case .rectangle:
            if isBackground {
                Rectangle()
                    .fill(fill(for: configuration, isBackground))
                    .if(configuration.border.colors.count > 0) { view in
                        view.overlay(
                            Rectangle()
                                .strokeBorder(
                                    fillBorder(for: configuration),
                                    style: strokeStyle()
                                )
                        )
                    }
            } else {
                Rectangle()
                    .fill(fill(for: configuration, isBackground))
            }
        case .capsule:
            if isBackground {
                Capsule()
                    .fill(fill(for: configuration, isBackground))
                    .if(configuration.border.colors.count > 0) { view in
                        view.overlay(
                            Capsule()
                                .strokeBorder(
                                    fillBorder(for: configuration),
                                    style: strokeStyle()
                                )
                        )
                    }
            } else {
                Capsule()
                    .fill(fill(for: configuration, isBackground))
            }
        case .circle:
            EmptyView() // circle defaults to capsule in progress bars
        case .roundedRectangle(let cornerRadius):
            if isBackground {
                RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                    .fill(fill(for: configuration, isBackground))
                    .if(configuration.border.colors.count > 0) { view in
                        view.overlay(
                            RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                                .strokeBorder(
                                    fillBorder(for: configuration),
                                    style: strokeStyle()
                                )
                        )
                    }
            } else {
                RoundedRectangle(cornerRadius: cornerRadius ?? 10)
                    .fill(fill(for: configuration, isBackground))
            }
        }
    }
    
    /// Creates a linear gradient fill for the progress bar.
    ///
    /// - Parameters:
    ///   - configuration: The configuration for the progress bar.
    ///   - isBackground: A Boolean indicating whether the fill is for the background.
    /// - Returns: A linear gradient fill.
    private func fill(
        for configuration: RainbowProgressBarConfiguration,
        _ isBackground: Bool = false) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: isBackground ? configuration.theme.backgroundColors : configuration.theme.foregroundColors),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    /// Creates a linear gradient fill for the progress bar's border.
    ///
    /// - Parameter configuration: The configuration for the progress bar.
    /// - Returns: A linear gradient fill for the border.
    private func fillBorder(
        for configuration: RainbowProgressBarConfiguration) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: currentBorderColors()),
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    /// Gets the current border colors for the progress bar.
    ///
    /// - Returns: An array of colors for the border.
    private func currentBorderColors() -> [Color] {
        if let interval = configuration.border.animationOptions?.interval, interval > 0 {
            return [configuration.border.colors[animatedBorderColorIndex % configuration.border.colors.count]]
        }
        return configuration.border.colors
    }
    
    /// Creates a stroke style for the progress bar's border.
    ///
    /// - Returns: A `StrokeStyle` instance.
    private func strokeStyle() -> StrokeStyle {
        StrokeStyle(
            lineWidth: configuration.border.width,
            dash: configuration.border.dashPattern
        )
    }
    
    /// Starts the border animation if applicable.
    private func startBorderAnimation() {
        guard let interval = configuration.border.animationOptions?.interval, interval > 0 else {
            return
        }
        
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            withAnimation {
                animatedBorderColorIndex = (animatedBorderColorIndex + 1) % configuration.border.colors.count
            }
        }
    }
}
