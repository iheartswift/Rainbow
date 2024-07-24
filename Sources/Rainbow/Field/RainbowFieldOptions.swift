import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

#if os(macOS)
import AppKit
#endif

public struct RainbowFieldTextOptions {
    
    /// use SecureField
    var isSecure: Bool
    
    /// The color of the text.
    /// - On macOS: Uses NSColor.textColor.
    /// - On iOS: Uses UIColor.label.
    var color: Color
    
    /// The formatter used to format the text.
    /// Defaults to RainbowFieldDefaultTextFormatter.
    var formatter: RainbowFieldTextFormatter
    
    #if canImport(UIKit)
    
    /// The capitalization style for the text input.
    /// - .none: No capitalization.
    /// - .sentences: Capitalizes the first letter of each sentence.
    /// - .words: Capitalizes the first letter of each word.
    /// - .allCharacters: Capitalizes all characters.
    var capitalization: UITextAutocapitalizationType
    
    /// The type of keyboard to display.
    /// - .default: Default keyboard.
    /// - .emailAddress: Keyboard optimized for email addresses.
    /// - .numeric: Keyboard optimized for numeric input.
    /// - .phonePad: Keyboard optimized for phone numbers.
    /// - .decimalPad: Keyboard optimized for decimal numbers.
    /// - .twitter: Keyboard optimized for Twitter usernames and hashtags.
    /// - .webSearch: Keyboard optimized for web searches.
    var keyboardType: UIKeyboardType
    #endif
    
    /// Determines if auto-correction is enabled.
    /// - true: Auto-correction is enabled.
    /// - false: Auto-correction is disabled.
    var autocorrection: Bool
    
    /// Determines if spell-checking is enabled.
    /// - true: Spell-checking is enabled.
    /// - false: Spell-checking is disabled.
    var spellChecking: Bool
    
    // MARK: - Initializers
    
    #if canImport(UIKit)
    public init(isSecure: Bool = false,
                color: Color = .gray,
                formatter: RainbowFieldTextFormatter = RainbowFieldDefaultTextFormatter(),
                capitalization: UITextAutocapitalizationType = .sentences,
                keyboardType: UIKeyboardType = .default,
                autocorrection: Bool = false,
                spellChecking: Bool = false) {
        self.isSecure = isSecure
        self.color = color
        self.formatter = formatter
        self.capitalization = capitalization
        self.keyboardType = keyboardType
        self.autocorrection = autocorrection
        self.spellChecking = spellChecking
    }
    #else
    public init(isSecure: Bool = false,
                    color: Color = .black,
                  formatter: RainbowFieldTextFormatter = RainbowFieldDefaultTextFormatter(),
                  autocorrection: Bool = false,
                  spellChecking: Bool = false) {
        self.isSecure = isSecure
        self.color = color
        self.formatter = formatter
        self.autocorrection = autocorrection
        self.spellChecking = spellChecking
    }
    #endif
}

// MARK: - Header

/// Configuration options for the header of a text field.
public struct RainbowFieldHeaderOptions {
    
    /// The placeholder text displayed when the field is empty.
    let text: String?

    /// The font used for the placeholder text.
    let font: Font
    
    /// The color of the placeholder text.
    let color: Color
    
    /// Initializer with default values
    public init(text: String? = nil, font: Font = .body, color: Color = .gray) {
        self.text = text
        self.font = font
        self.color = color
    }
}

// MARK: - Placeholder Text

/// Configuration options for the placeholder text in the text field.
public struct RainbowFieldPlaceholderTextOptions {
    
    /// The placeholder text displayed when the field is empty.
    let text: String

    /// The font used for the placeholder text.
    let font: Font
    
    /// The color of the placeholder text.
    let color: Color
    
    /// Initializer with default values
    public init(text: String = "", font: Font = .body, color: Color = .gray) {
        self.text = text
        self.font = font
        self.color = color
    }
}

// MARK: - Caption text options

/// Configuration options for the caption text displayed below the text field.
public struct RainbowFieldCaptionTextOptions {
    
    /// The font used for the caption text.
    let font: Font
    
    /// Initializer with default values
    public init(font: Font = .caption) {
        self.font = font
    }
}

// MARK: - Cursor options

/// Configuration options for the cursor in the text field.
public struct RainbowFieldCursorOptions {
    
    /// The color of the cursor.
    let color: Color
    
    /// Initializer with default values
    public init(color: Color = .gray) {
        self.color = color
    }
}

// MARK: - Clear field options

/// Configuration options for the clear button in the text field.
public struct RainbowFieldClearButtonOptions {
    
    /// The system name of the icon used for the clear button.
    let imageSystemName: String
    
    /// The color applied to the clear button icon.
    let color: Color
    
    /// Initializer with default values
    public init(imageSystemName: String = "xmark.circle.fill", color: Color = RainbowFieldStateAppearanceConfiguration.lightGray) {
        self.imageSystemName = imageSystemName
        self.color = color
    }
}

// MARK: - Rainbow Icon options

/// Configuration options for icons in the text field.
public struct RainbowFieldIconOptions {
    
    /// The system name of the image displayed on the left side of the text field.
    let leftImageSystemName: String?
    
    /// The system name of the image displayed on the right side of the text field.
    let rightImageSystemName: String?
    
    /// Whether to only show the right image if the text field is valid and not in a focused state.
    /// Useful for showing checkmarks or X icons when the field is valid or invalid and the user moves out of the focus state.
    let onlyShowRightImageIfNotFocused: Bool
    
    /// Initializer with default values
    public init(leftImageSystemName: String? = nil, rightImageSystemName: String? = nil, onlyShowRightImageIfNotFocused: Bool = false) {
        self.leftImageSystemName = leftImageSystemName
        self.rightImageSystemName = rightImageSystemName
        self.onlyShowRightImageIfNotFocused = onlyShowRightImageIfNotFocused
    }
}


/// A struct that represents options for a Call-to-Action (CTA) in a field.
public struct RainbowFieldCTAOptions {
    public var text: String
    public var action: (() -> Void)?
    
    /// Initializes a new `RainbowFieldCTAOptions` with the specified text and action.
    /// - Parameters:
    ///   - text: The text to be displayed for the CTA.
    ///   - action: The action to be executed when the CTA is triggered. It is an optional closure.
    public init(text: String, action: @escaping (() -> Void)) {
        self.text = text
        self.action = action
    }
}
