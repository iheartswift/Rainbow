/// A protocol that defines a provider for haptic feedback.
///
/// Conforming types are responsible for triggering haptic feedback based on the specified `RainbowHapticOptions.HapticType`.
public protocol RainbowHapticFeedbackProvider {
    
    /// Triggers haptic feedback of the specified type.
    ///
    /// - Parameter type: The type of haptic feedback to trigger.
    func triggerHapticFeedback(for type: RainbowHapticOptions.HapticType)
}
