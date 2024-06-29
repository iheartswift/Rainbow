#if canImport(UIKit) && !os(watchOS) && !os(tvOS)
import UIKit

/// A concrete implementation of `RainbowHapticFeedbackProvider` that provides haptic feedback using `UIKit`'s feedback generators.
///
/// This struct triggers different types of haptic feedback based on the specified `RainbowHapticOptions.HapticType`.
public struct RainbowHapticOptionsFeedbackProvider: RainbowHapticFeedbackProvider {
    
    /// Triggers haptic feedback of the specified type.
    ///
    /// - Parameter type: The type of haptic feedback to trigger.
    public func triggerHapticFeedback(for type: RainbowHapticOptions.HapticType) {
        switch type {
        case .light:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case .medium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case .heavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        case .selection:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        case .success:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        case .warning:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        case .error:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
}
#endif
