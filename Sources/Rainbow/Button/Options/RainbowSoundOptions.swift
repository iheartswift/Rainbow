//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//

import AVFoundation

public struct RainbowSoundOptions {
    
    public enum SystemSound: String, CaseIterable {
        case tap
        case click
        case pop
        // Add more system sounds as needed
    }
    
    public var selectedSound: SystemSound?
    
    public init(selectedSound: SystemSound? = nil) {
        self.selectedSound = selectedSound
    }
    
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
