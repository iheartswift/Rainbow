import SwiftUI

// MARK: - Field Configuration

/// Configuration for a text field, including various options for its appearance and behavior.
public struct RainbowFieldConfiguration {
    
    var fieldStyle: RainbowFieldStyle = .default
    
    /// The shape of the field's bounding box.
    var shapeType: RainbowShapeType = .roundedRectangle()
    
    /// Header options for the field, if any.
    var headerOptions: RainbowFieldHeaderOptions?
    
    /// Options for the text within the field.
    var textOptions: RainbowFieldTextOptions?
    
    // CTA Options
    var ctaOptions: RainbowFieldCTAOptions?
    
    /// Options for the placeholder text within the field.
    var placeholderTextOptions = RainbowFieldPlaceholderTextOptions()
    
    /// Options for the caption text displayed below the field.
    var captionTextOptions = RainbowFieldCaptionTextOptions()
    
    /// Options for the cursor within the field.
    var cursorOptions = RainbowFieldCursorOptions()
    
    /// Options for the clear button, used in fields such as username, email, password, and custom fields.
    var clearButtonOptions = RainbowFieldClearButtonOptions()
    
    /// Options for icons within the field.
    var iconOptions: RainbowFieldIconOptions?
        
    /// Appearance configuration when the field is idle and untouched.
    var idleStateAppearance: RainbowFieldStateAppearanceConfiguration = .defaultIdleStateAppearanceConfiguration
    
    /// Appearance configuration when the field is in focus and ready for user input.
    var focusStateAppearance: RainbowFieldStateAppearanceConfiguration = .defaultActiveStateAppearanceConfiguration
    
    /// Appearance configuration when the field's input is valid.
    var validStateAppearance: RainbowFieldStateAppearanceConfiguration = .defaultValidStateAppearanceConfiguration
    
    /// Appearance configuration when the field's input is invalid.
    var invalidStateAppearance: RainbowFieldStateAppearanceConfiguration = .defaultInvalidStateAppearanceConfiguration
    
    /// Validation rules for the field's input.
    var validationRules: [RainbowFieldValidationRule] = [
        RainbowFieldValidationRule(message: "Text can't be empty", validate: { input in
            !input.isEmpty
        })
    ]
}

