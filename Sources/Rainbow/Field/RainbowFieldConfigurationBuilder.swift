import Foundation

// MARK: - RainbowFieldConfiguration.Builder

extension RainbowFieldConfiguration {
    
    /// Builder class for constructing a `RainbowFieldConfiguration` with a fluent API.
    public class Builder {
        
        // Internal reference to the configuration
        private var configuration: RainbowFieldConfiguration
        
        // MARK: Initialization
        
        /// Initializes the builder with default configuration values.
        public init() {
            self.configuration = RainbowFieldConfiguration()
        }
        
        // MARK: Configuration Setters
        
        public func setFieldStyle(_ style: RainbowFieldStyle) -> Self {
            configuration.fieldStyle = style
            return self
        }
        
        /// Sets the shape type of the field.
        /// - Parameter shapeType: The `RainbowShapeType` to set.
        /// - Returns: The current builder instance.
        public func setShapeType(_ shapeType: RainbowShapeType) -> Self {
            configuration.shapeType = shapeType
            return self
        }
        
        /// Sets the header options for the field.
        /// - Parameter options: The `RainbowFieldHeaderOptions` to set.
        /// - Returns: The current builder instance.
        public func setHeaderOptions(_ options: RainbowFieldHeaderOptions?) -> Self {
            configuration.headerOptions = options
            return self
        }
        
        /// Sets the text options for the field.
        /// - Parameter options: The `RainbowFieldTextOptions` to set.
        /// - Returns: The current builder instance.
        public func setTextOptions(_ options: RainbowFieldTextOptions) -> Self {
            configuration.textOptions = options
            return self
        }
        
        /// Sets the text options for the cta field.
        /// - Parameter options: The `RainbowFieldTextOptions` to set.
        /// - Returns: The current builder instance.
        public func setCTAOptions(_ options: RainbowFieldCTAOptions) -> Self {
            configuration.ctaOptions = options
            return self
        }
        
        /// Sets the placeholder text options for the field.
        /// - Parameter options: The `RainbowFieldPlaceholderTextOptions` to set.
        /// - Returns: The current builder instance.
        public func setPlaceholderTextOptions(_ options: RainbowFieldPlaceholderTextOptions) -> Self {
            configuration.placeholderTextOptions = options
            return self
        }
        
        /// Sets the caption text options for the field.
        /// - Parameter options: The `RainbowFieldCaptionTextOptions` to set.
        /// - Returns: The current builder instance.
        public func setCaptionTextOptions(_ options: RainbowFieldCaptionTextOptions) -> Self {
            configuration.captionTextOptions = options
            return self
        }
        
        /// Sets the cursor options for the field.
        /// - Parameter options: The `RainbowFieldCursorOptions` to set.
        /// - Returns: The current builder instance.
        public func setCursorOptions(_ options: RainbowFieldCursorOptions) -> Self {
            configuration.cursorOptions = options
            return self
        }
        
        /// Sets the clear button options for the field.
        /// - Parameter options: The `RainbowFieldClearButtonOptions` to set.
        /// - Returns: The current builder instance.
        public func setClearButtonOptions(_ options: RainbowFieldClearButtonOptions) -> Self {
            configuration.clearButtonOptions = options
            return self
        }
        
        /// Sets the icon options for the field.
        /// - Parameter options: The `RainbowFieldIconOptions` to set.
        /// - Returns: The current builder instance.
        public func setIconOptions(_ options: RainbowFieldIconOptions?) -> Self {
            configuration.iconOptions = options
            return self
        }
        
        /// Sets the appearance configuration for the idle state.
        /// - Parameter appearance: The `RainbowTextFieldStateAppearanceConfiguration` for idle state.
        /// - Returns: The current builder instance.
        public func setIdleStateAppearance(_ appearance: RainbowFieldStateAppearanceConfiguration) -> Self {
            configuration.idleStateAppearance = appearance
            return self
        }
        
        /// Sets the appearance configuration for the focus state.
        /// - Parameter appearance: The `RainbowTextFieldStateAppearanceConfiguration` for focus state.
        /// - Returns: The current builder instance.
        public func setFocusStateAppearance(_ appearance: RainbowFieldStateAppearanceConfiguration) -> Self {
            configuration.focusStateAppearance = appearance
            return self
        }
        
        /// Sets the appearance configuration for the valid state.
        /// - Parameter appearance: The `RainbowTextFieldStateAppearanceConfiguration` for valid state.
        /// - Returns: The current builder instance.
        public func setValidStateAppearance(_ appearance: RainbowFieldStateAppearanceConfiguration) -> Self {
            configuration.validStateAppearance = appearance
            return self
        }
        
        /// Sets the appearance configuration for the invalid state.
        /// - Parameter appearance: The `RainbowTextFieldStateAppearanceConfiguration` for invalid state.
        /// - Returns: The current builder instance.
        public func setInvalidStateAppearance(_ appearance: RainbowFieldStateAppearanceConfiguration) -> Self {
            configuration.invalidStateAppearance = appearance
            return self
        }
        
        /// Sets the validation rules for the field.
        /// - Parameter rules: An array of `RainbowFieldValidationRule` to set.
        /// - Returns: The current builder instance.
        public func setValidationRules(_ rules: [RainbowFieldValidationRule]) -> Self {
            configuration.validationRules = rules
            return self
        }
        
        // MARK: Build
        
        /// Builds and returns the final `RainbowFieldConfiguration`.
        /// - Returns: The constructed `RainbowFieldConfiguration`.
        public func build() -> RainbowFieldConfiguration {
            return configuration
        }
    }
}
