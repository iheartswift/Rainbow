//
//  RainbowHapticOptionsFeedbackProvider.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

#if canImport(UIKit) && !os(watchOS) && !os(tvOS)
import UIKit

public struct RainbowHapticOptionsFeedbackProvider: RainbowHapticFeedbackProvider {
    
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
