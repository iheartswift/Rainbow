//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//

import UIKit

/// A struct representing haptic feedback options for a button.
public struct RainbowHapticOptions {
    
    /// An enumeration of the different types of haptic feedback.
    public enum HapticType: String, CaseIterable {
        case light
        case medium
        case heavy
        case selection
        case success
        case warning
        case error
    }
    
    /// The selected type of haptic feedback.
    public var selectedHaptic: HapticType?
    
    /// Initializes a new instance of `RainbowHapticOptions` with the specified haptic type.
    ///
    /// - Parameter selectedHaptic: The selected type of haptic feedback. Default is `nil`.
    public init(selectedHaptic: HapticType? = nil) {
        self.selectedHaptic = selectedHaptic
    }
    
    /// Triggers the haptic feedback based on the selected haptic type.
    public func trigger() {
        guard let selectedHaptic = selectedHaptic else { return }
        switch selectedHaptic {
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
