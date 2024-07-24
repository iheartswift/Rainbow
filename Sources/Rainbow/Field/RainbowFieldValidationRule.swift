import Foundation

/// A structure representing a validation rule for a text field.
/// It includes a message to display when validation fails and a closure to validate the text.
public struct RainbowFieldValidationRule {
    
    /// A message to display when the validation fails.
    /// This message is typically shown to the user to inform them of the validation error.
    let message: String
    
    /// A closure that defines the validation logic.
    /// - Parameter text: The input text to be validated.
    /// - Returns: A boolean value indicating whether the input text is valid according to the rule.
    let validate: (String) -> Bool
    
    /// Initializer
    public init(message: String, validate: @escaping (String) -> Bool) {
        self.message = message
        self.validate = validate
    }
}
