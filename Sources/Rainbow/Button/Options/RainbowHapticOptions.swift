//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//

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
    
    /// The haptic feedback provider.
    private var feedbackProvider: RainbowHapticFeedbackProvider
    
    /// Initializes a new instance of `RainbowHapticOptions` with the specified haptic type and feedback provider.
    ///
    /// - Parameters:
    ///   - selectedHaptic: The selected type of haptic feedback. Default is `nil`.
    ///   - feedbackProvider: The haptic feedback provider. Default is the appropriate provider based on platform.
    public init(selectedHaptic: HapticType? = nil, feedbackProvider: RainbowHapticFeedbackProvider? = nil) {
        self.selectedHaptic = selectedHaptic
        #if canImport(UIKit) && !os(watchOS) && !os(tvOS )
        self.feedbackProvider = feedbackProvider ?? RainbowHapticOptionsFeedbackProvider()
        #else
        self.feedbackProvider = feedbackProvider ?? RainbowNoOpHapticFeedbackProvider()
        #endif
    }
    
    /// Triggers the haptic feedback based on the selected haptic type.
    public func trigger() {
        guard let selectedHaptic = selectedHaptic else { return }
        feedbackProvider.triggerHapticFeedback(for: selectedHaptic)
    }
}
