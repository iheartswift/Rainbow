//
//  RainbowHapticFeedbackProvider.swift
//
//
//  Created by Adam Dahan on 2024-06-16.
//

import Foundation

public protocol RainbowHapticFeedbackProvider {
    func triggerHapticFeedback(for type: RainbowHapticOptions.HapticType)
}
