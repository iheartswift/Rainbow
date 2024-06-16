//
//  RainbowButtonStyleModifier.swift
//
//
//  Created by Adam Dahan on 2024-06-14.
//

import SwiftUI

/**
 A view modifier that applies a rainbow button style to a view.
 
 This modifier applies a rainbow button style to a view, with a loading indicator and various customizable options.
 */
struct RainbowButtonStyleModifier: ViewModifier {
    let configuration: RainbowButtonConfiguration
    @Binding var isLoading: Bool

    @State private var isPressed: Bool = false

    @ViewBuilder
    func contentView(from content: Content) -> some View {
        if let contentGradient = configuration.contentGradient {
            content
                .opacity(isLoading ? 0.0 : 1.0)
                .foregroundStyle(contentGradient.gradient)
        } else {
            content
                .opacity(isLoading ? 0.0 : 1.0)
        }
    }

    func body(content: Content) -> some View {
        ZStack {
            contentView(from: content)
            RainbowLoaderView(configuration: configuration)
                .tint(configuration.theme.foreground)
                .opacity(isLoading ? 1.0 : 0.0)
        }
        .underline(configuration.underline, color: Color(UIColor.label))
        .font(configuration.size.font)
        .padding(configuration.size.padding)
        .foregroundColor(configuration.theme.foreground)
        .background(
            Group {
                if configuration.shapeType == .capsule {
                    Capsule()
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: configuration.border.colors),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: StrokeStyle(
                                lineWidth: configuration.border.width,
                                dash: configuration.border.dashPattern
                            )
                        )
                } else if configuration.shapeType == .roundedRectangle || configuration.shapeType == .rectangle {
                    RoundedRectangle(cornerRadius: configuration.cornerRadius)
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: configuration.border.colors),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: StrokeStyle(
                                lineWidth: configuration.border.width,
                                dash: configuration.border.dashPattern
                            )
                        )
                } else if configuration.shapeType == .circle {
                    Circle()
                        .fill(fill(for: configuration))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: configuration.border.colors),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            style: StrokeStyle(
                                lineWidth: configuration.border.width,
                                dash: configuration.border.dashPattern
                            )
                        )
                }
            }
        )
        .shadow(color: configuration.shadow.color, radius: configuration.shadow.radius, x: configuration.shadow.x, y: configuration.shadow.y)
    }
    
    private func strokeStyle(from configuration: RainbowButtonConfiguration) -> StrokeStyle {
        StrokeStyle(
            lineWidth: configuration.border.width,
            dash: configuration.border.dashPattern
        )
    }
    
    private func runAnimation(interval: TimeInterval) -> Void {
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
               () -> Void in
               Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                   withAnimation {
                       currentIndex = (currentIndex + 1) % configuration.border.colors.count
                   }
               }
           }
    }
    
    private func fill(for configuration: RainbowButtonConfiguration) -> some ShapeStyle {
        let standardGradient = LinearGradient(
            colors: [configuration.theme.background],
            startPoint: .leading,
            endPoint: .trailing
        )
        let backgroundGradient = LinearGradient(
            colors: configuration.backgroundGradient?.colors ?? [],
            startPoint: configuration.backgroundGradient?.startPoint ?? .leading,
            endPoint: configuration.backgroundGradient?.endPoint ?? .trailing
        )
        return configuration.backgroundGradient == nil ? standardGradient : backgroundGradient
    }
    
    @State private var currentIndex = 0
    var currentColor: Color {
        configuration.border.colors[currentIndex]
    }
}
