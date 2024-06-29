import SwiftUI

/// A struct containing default values for Rainbow components.
public struct RainbowDefaults {

    /// The default corner radius for Rainbow components.
    public static var cornerRadius: CGFloat = 8.0
    
    /// The default rainbow colors.
    public static var colors: [Color] = [
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .indigo,
        .purple
    ]
    
    /// An adaptive background color that changes based on the current user interface style (light or dark mode).
    public static var adaptiveColor: Color {
        #if os(macOS)
        let appearance = NSApplication.shared.effectiveAppearance
        let isDarkMode = appearance.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
        return Color(isDarkMode ? NSColor.black : NSColor.white)
        #else
        return Color(UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor.black
            default:
                return UIColor.white
            }
        })
        #endif
    }
}
