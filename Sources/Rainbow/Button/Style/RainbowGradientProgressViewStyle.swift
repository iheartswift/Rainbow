//
//  File.swift
//  
//
//  Created by Adam Dahan on 2024-06-15.
//

import SwiftUI

/**
 A custom ProgressViewStyle that uses a gradient as the background.

 - Parameters:
   - gradient: The AngularGradient to use as the background.

 - Returns: A ProgressViewStyle that applies the gradient background.
 */
public struct RainbowGradientProgressViewStyle: ProgressViewStyle {
    let gradient: AngularGradient

    public init(gradient: AngularGradient) {
        self.gradient = gradient
    }

    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(gradient)
            ProgressView(configuration)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(.white)
        }
    }
}
