import Foundation

/// A protocol for formatting text input according to specific rules or patterns.
/// Conforming types must implement the `format(_:)` method to format the input text.
public protocol RainbowFieldTextFormatter {
    
    /// Formats the given text based on the formatter's rules.
    /// - Parameter text: The input text to be formatted.
    /// - Returns: A formatted version of the input text.
    func format(_ text: String) -> String
}

/// A default text formatter that does not modify the input text.
/// Returns the input text as-is.
public struct RainbowFieldDefaultTextFormatter: RainbowFieldTextFormatter {
    
    public init() { }
    
    /// Returns the input text without any formatting.
    /// - Parameter text: The input text to be formatted.
    /// - Returns: The same text as the input.
    public func format(_ text: String) -> String {
        return text
    }
}

/// A text formatter that formats phone numbers into a standard pattern.
/// The pattern used is "# (###) ###-####".
public struct RainbowPhoneNumberFormatter: RainbowFieldTextFormatter {
    
    public init() { }
    
    /// Formats the input text into a phone number pattern.
    /// - Parameter text: The input phone number text to be formatted.
    /// - Returns: The formatted phone number string.
    public func format(_ text: String) -> String {
        // Remove non-numeric characters from the input text
        let cleanedNumber = text.filter { $0.isNumber }
        // Apply the phone number pattern
        return cleanedNumber.applyPatternOnNumbers(
            pattern: "# (###) ###-####",
            replacementCharacter: "#"
        )
    }
}

/// A text formatter that formats credit card numbers into a standard pattern.
/// The pattern used is "#### #### #### ####".
public struct RainbowCreditCardFormatter: RainbowFieldTextFormatter {
    
    public init() { }
    
    /// Formats the input text into a credit card number pattern.
    /// - Parameter text: The input credit card number text to be formatted.
    /// - Returns: The formatted credit card number string.
    public func format(_ text: String) -> String {
        // Remove non-numeric characters from the input text
        let cleanedNumber = text.filter { $0.isNumber }
        // Apply the credit card number pattern
        return cleanedNumber.applyPatternOnNumbers(
            pattern: "#### #### #### ####",
            replacementCharacter: "#"
        )
    }
}

/// A text formatter that formats Social Security Numbers (SSNs) into a standard pattern.
/// The pattern used is "###-##-####".
public struct RainbowSSNFormatter: RainbowFieldTextFormatter {
    
    /// Formats the input text into an SSN pattern.
    /// - Parameter text: The input SSN text to be formatted.
    /// - Returns: The formatted SSN string.
    public func format(_ text: String) -> String {
        // Remove non-numeric characters from the input text
        let cleanedNumber = text.filter { $0.isNumber }
        // Apply the SSN pattern
        return cleanedNumber.applyPatternOnNumbers(
            pattern: "###-##-####",
            replacementCharacter: "#"
        )
    }
}

private extension String {
    
    /// Applies a specific pattern to a string of numbers.
    /// - Parameters:
    ///   - pattern: The pattern to apply, where `replacementCharacter` represents the positions for the numbers.
    ///   - replacementCharacter: The character in the pattern that indicates where to insert the numbers.
    /// - Returns: The formatted string based on the pattern.
    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        // Filter out non-numeric characters from the input string
        let pureNumber = self.filter { $0.isNumber }
        var formattedString = ""
        var patternIndex = pattern.startIndex
        var pureNumberIndex = pureNumber.startIndex
        
        // Iterate through the pattern and format the number accordingly
        while patternIndex != pattern.endIndex && pureNumberIndex != pureNumber.endIndex {
            if pattern[patternIndex] == replacementCharacter {
                formattedString.append(pureNumber[pureNumberIndex])
                pureNumberIndex = pureNumber.index(after: pureNumberIndex)
            } else {
                formattedString.append(pattern[patternIndex])
            }
            patternIndex = pattern.index(after: patternIndex)
        }
        
        return formattedString
    }
}
