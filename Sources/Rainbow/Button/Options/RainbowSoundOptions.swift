//
//  RainbowSoundOptions.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//
#if canImport(AVFoundation) && !os(watchOS)
import AVFoundation

public struct RainbowSoundOptions {
    
    /// An enumeration of the different system sounds available.
    public enum SystemSound: String, CaseIterable {
        case tap
        case click
        case pop
        // Add more system sounds as needed
    }
    
    /// The selected system sound to play.
    public var selectedSound: SystemSound?
    
    /// Initializes a new instance of `RainbowSoundOptions` with the specified sound.
    ///
    /// - Parameter selectedSound: The selected system sound. Default is `nil`.
    public init(selectedSound: SystemSound? = nil) {
        self.selectedSound = selectedSound
    }
    
    /// Plays the selected system sound.
    public func play() {
        guard let selectedSound = selectedSound else { return }
        let systemSoundID: SystemSoundID
        
        switch selectedSound {
        case .tap:
            systemSoundID = 1104 // Example sound ID
        case .click:
            systemSoundID = 1105 // Example sound ID
        case .pop:
            systemSoundID = 1106 // Example sound ID
        }
        
        AudioServicesPlaySystemSound(systemSoundID)
    }
}

#else

public struct RainbowSoundOptions {
    
    /// An enumeration of the different system sounds available.
    public enum SystemSound: String, CaseIterable {
        case tap
        case click
        case pop
        // Add more system sounds as needed
    }
    
    /// The selected system sound to play.
    public var selectedSound: SystemSound?
    
    /// Initializes a new instance of `RainbowSoundOptions` with the specified sound.
    ///
    /// - Parameter selectedSound: The selected system sound. Default is `nil`.
    public init(selectedSound: SystemSound? = nil) {
        self.selectedSound = selectedSound
    }
    
    /// Plays the selected system sound.
    public func play() {
        // No-op implementation for platforms that do not support AVFoundation
    }
}

#endif
