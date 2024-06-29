import Foundation

/// A no-operation (no-op) implementation of `RainbowHapticFeedbackProvider`.
///
/// This struct provides a no-op implementation of the `triggerHapticFeedback(for:)` method,
/// effectively disabling haptic feedback.
public struct RainbowNoOpHapticFeedbackProvider: RainbowHapticFeedbackProvider {
    
    /// Triggers haptic feedback of the specified type.
    ///
    /// This implementation does nothing, providing a way to disable haptic feedback.
    ///
    /// - Parameter type: The type of haptic feedback to trigger.
    public func triggerHapticFeedback(for type: RainbowHapticOptions.HapticType) {
        // No-op implementation
    }
}
