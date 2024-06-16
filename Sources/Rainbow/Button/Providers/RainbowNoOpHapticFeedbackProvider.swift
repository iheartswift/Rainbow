//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-16.
//

import Foundation

public struct RainbowNoOpHapticFeedbackProvider: RainbowHapticFeedbackProvider {
    
    public func triggerHapticFeedback(for type: RainbowHapticOptions.HapticType) {
        // No-op implementation
    }
}
