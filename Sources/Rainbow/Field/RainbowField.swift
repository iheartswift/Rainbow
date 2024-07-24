import SwiftUI

/// A SwiftUI view that displays a text field or secure field with configurable options, validation, and styling.
/// It adapts based on the field type and state, providing dynamic validation and appearance updates.
public struct RainbowField: View {
    
    /// Encapsulated adjustments
    private struct Defaults {
        static let paddingSmall: CGFloat = 2.0
        static let fieldOffsetX: CGFloat = 8.0
        static let buttonOffsetX: CGFloat = 0.5
        static let fieldPadding: CGFloat = 10.0
        static let gap: CGFloat = 15.0
    }

    /// Observed object
    @ObservedObject private var viewModel: RainbowFieldViewModel
    
    /// Used to calculate round corners of optional cta button
    @State private var backgroundHeight: CGFloat = 0.0
    
    /// is field focused
    @FocusState private var focusState: Bool

    /// Initializes a `RainbowField` with a view model.
    /// - Parameter viewModel: The view model providing data and configuration for the field.
    public init(viewModel: RainbowFieldViewModel) {
        self.viewModel = viewModel
    }

    /// Retrieves the text formatter from the view model's configuration.
    /// - Returns: The formatter used for text formatting, or `nil` if not specified.
    private var textFormatter: RainbowFieldTextFormatter? {
        viewModel.configuration.textOptions?.formatter
    }

    /// Creates a binding for the text field that applies the formatter for text input and output.
    /// - Returns: A `Binding` that provides formatted text input and output.
    private var formattedText: Binding<String> {
        Binding<String>(
            get: {
                guard let formatter = textFormatter else {
                    return viewModel.text
                }
                return formatter.format(viewModel.text)
            },
            set: { newValue in
                
                /// Set formatted version of text
                guard let formatter = textFormatter else {
                    viewModel.text = newValue
                    return
                }
                let cleanedText = formatter.format(newValue)
                if viewModel.text != cleanedText {
                    viewModel.text = cleanedText
                }
            }
        )
    }

    /// Generates the header view if header options are provided.
    /// - Returns: A view displaying the header text with specified font and padding, if applicable.
    @ViewBuilder
    private var header: some View {
        if let options = viewModel.configuration.headerOptions, let text = options.text {
            Text(text)
                .font(options.font)
                .padding(.bottom, Defaults.paddingSmall)
                .foregroundColor(options.color)
        }
    }

    /// Generates the left image view if an image system name is provided in the configuration.
    /// - Returns: A view displaying the left image with specified tint color, if applicable.
    @ViewBuilder
    private var leftImage: some View {
        if let leftImage = viewModel.configuration.iconOptions?.leftImageSystemName {
            Image(systemName: leftImage)
                .padding(.leading)
                .foregroundColor(viewModel.currentStateAppearanceConfiguration.leftImageTintColor)
        }
    }

    /// Generates the secure field view with configuration and styling.
    /// - Returns: A `SecureField` view with configured placeholder, color, and text handling.
    @ViewBuilder
    private var secureField: some View {
        SecureField(
            viewModel.configuration.placeholderTextOptions.text,
            text: $viewModel.text,
            prompt: Text(viewModel.configuration.placeholderTextOptions.text)
                .foregroundColor(viewModel.configuration.placeholderTextOptions.color)
        )
        .focused($focusState)
        .padding(Defaults.fieldPadding)
        .onChange(of: viewModel.text) { _, _ in
            viewModel.validateText()
        }
        .onChange(of: focusState) { _, newValue in
            viewModel.isFocused = newValue
            viewModel.validateText()
        }
        .accentColor(viewModel.configuration.cursorOptions.color)
        .foregroundColor(viewModel.configuration.textOptions?.color)
        .textFieldStyle(PlainTextFieldStyle())
    }

    /// Generates the text field view with configuration and styling.
    /// - Returns: A `TextField` view with configured placeholder, color, text formatting, and keyboard type.
    @ViewBuilder
    private var textField: some View {
        TextField(
            viewModel.configuration.placeholderTextOptions.text,
            text: formattedText,
            prompt: Text(viewModel.configuration.placeholderTextOptions.text)
                .foregroundColor(viewModel.configuration.placeholderTextOptions.color)
        )
        .focused($focusState)
        .padding(Defaults.fieldPadding)
        .onChange(of: viewModel.text) { _, _ in
            viewModel.validateText()
        }
        .onChange(of: focusState) { _, newValue in
            viewModel.isFocused = newValue
            viewModel.validateText()
        }
        #if canImport(UIKit)
        .keyboardType(viewModel.configuration.textOptions?.keyboardType ?? .default)
        .autocapitalization(viewModel.configuration.textOptions?.capitalization ?? .none)
        .disableAutocorrection(!(viewModel.configuration.textOptions?.autocorrection ?? false) ?? false)
        #endif
        .accentColor(viewModel.configuration.cursorOptions.color)
        .foregroundColor(viewModel.configuration.textOptions?.color)
        .textFieldStyle(PlainTextFieldStyle())
    }

    /// Chooses between a secure field or a text field based on the field type and wraps it in a `VStack`.
    /// - Returns: A view that displays either a secure field or a text field.
    @ViewBuilder
    private var field: some View {
        VStack {
            if let isSecure = viewModel.configuration.textOptions?.isSecure, isSecure {
                secureField
            } else {
                textField
            }
        }
        .offset(x: -Defaults.fieldOffsetX)
    }

    /// Generates a button to clear the text field content and validation messages.
    /// - Returns: A `Button` view with an icon and action to clear the text field.
    @ViewBuilder
    private var clearButton: some View {
        Button(action: {
            viewModel.reset()
        }) {
            Image(systemName: viewModel.configuration.clearButtonOptions.imageSystemName)
                .foregroundColor(viewModel.configuration.clearButtonOptions.color)
        }
        .buttonStyle(RainbowClearButtonStyle())
    }

    /// Generates the right image view based on validation and focus state.
    /// - Parameter systemName: The system name of the image to display.
    /// - Returns: A view displaying the right image with appropriate styling based on validation and focus state.
    @ViewBuilder
    private func rightImage(systemName: String) -> some View {
        if let options = viewModel.configuration.iconOptions, options.onlyShowRightImageIfNotFocused {
            if viewModel.isValid {
                Image(systemName: systemName)
                    .foregroundColor(viewModel.currentStateAppearanceConfiguration.rightImageTintColor)
            }
        } else {
            Image(systemName: systemName)
                .foregroundColor(viewModel.currentStateAppearanceConfiguration.rightImageTintColor)
        }
    }

    /// Decides between showing the clear button or the right image based on focus and text state.
    /// - Returns: A view displaying either the clear button or the right image.
    @ViewBuilder
    private var clearButtonOrRightImage: some View {
        if viewModel.isFocused && !viewModel.text.isEmpty {
            clearButton
        } else if let rightImageSystemName = viewModel.configuration.iconOptions?.rightImageSystemName {
            rightImage(systemName: rightImageSystemName)
        }
    }

    /// Displays the caption or validation messages based on the current state.
    /// - Returns: A view showing either the caption text or validation messages.
    @ViewBuilder
    private var captionOrValidationMessages: some View {
        if let captionText = viewModel.currentStateAppearanceConfiguration.captionText {
            Text(captionText)
                .font(viewModel.configuration.captionTextOptions.font)
                .foregroundColor(viewModel.currentStateAppearanceConfiguration.captionColor)
                .padding(.top, 2)
        } else {
            ForEach(viewModel.validationMessages, id: \.self) { message in
                Text(message)
                    .font(viewModel.configuration.captionTextOptions.font)
                    .foregroundColor(viewModel.currentStateAppearanceConfiguration.captionColor)
            }
        }
    }
        
    var hasLeftImage: Bool {
        viewModel.configuration.iconOptions?.leftImageSystemName != nil
    }
    
    @ViewBuilder
    var defaultStyle: some View {
        header
        HStack {
            leftImage
            field
                .padding(.leading, hasLeftImage ? 0 : Defaults.gap)
            clearButtonOrRightImage
                .padding(.trailing, Defaults.gap)
        }
        .background(backgroundView)
    }
        
    @ViewBuilder
    var ctaStyle: some View {
        header
        HStack {
            leftImage
            field
                .padding(.leading, hasLeftImage ? 0 : Defaults.gap)
            clearButtonOrRightImage
                .padding(.trailing, Defaults.paddingSmall)
            ctaButton(for: viewModel.configuration.shapeType, height: backgroundHeight)
                .offset(x: -Defaults.buttonOffsetX)
        }
        .background(
            GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        backgroundHeight = geometry.size.height
                    }
            }
            .background(backgroundView)
        )
    }

    /// The main body of the view, arranging header, field, and caption or validation messages.
    /// - Returns: A `VStack` containing the header, text field, and caption or validation messages.
    public var body: some View {
        VStack(alignment: .leading) {
            switch viewModel.configuration.fieldStyle {
            case .default:
                defaultStyle
            case .cta:
                /// No round corners on macOS
                #if canImport(UIKit)
                ctaStyle
                #else
                defaultStyle
                #endif
            }
            captionOrValidationMessages
        }
        .padding()
        .disabled(!viewModel.isEnabled)
    }
    
    private func ctaButton(for shapeType: RainbowShapeType, height: CGFloat) -> some View {
        var radius: CGFloat = 0.0
        switch shapeType {
        case .circle:
            radius = 8.0 // default
        case .roundedRectangle(let cornerRadius):
            radius = cornerRadius ?? 8.0
        case .rectangle:
            radius = 0.0
        case .capsule:
            radius = height / 2
        }
        return Button {
            guard let action = viewModel.configuration.ctaOptions?.action else {
                return
            }
            action()
        } label: {
            Text(viewModel.configuration.ctaOptions?.text ?? "")
                .padding(10)
                .foregroundColor(viewModel.currentStateAppearanceConfiguration.buttonForegroundColor)
                .background(viewModel.currentStateAppearanceConfiguration.buttonBackgroundColor)
            #if canImport(UIKit)
                .clipShape(RainbowRoundedCorner(corners: [.bottomRight, .topRight], radius: radius)) // Adjust the radius as needed
            #endif
        }
    }

    /// Generates the background view for the text field, based on the configuration's shape type.
    /// - Returns: A view that displays the background with border color and width based on the current state appearance.
    @ViewBuilder
    private var backgroundView: some View {
        switch viewModel.configuration.shapeType {
        case .rectangle:
            Rectangle()
                .stroke(viewModel.currentStateAppearanceConfiguration.borderColor, lineWidth: viewModel.currentStateAppearanceConfiguration.borderWidth)
        case .roundedRectangle(let cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius ?? RainbowDefaults.cornerRadius)
                .stroke(viewModel.currentStateAppearanceConfiguration.borderColor, lineWidth: viewModel.currentStateAppearanceConfiguration.borderWidth)
        case .capsule:
            Capsule()
                .stroke(viewModel.currentStateAppearanceConfiguration.borderColor, lineWidth: viewModel.currentStateAppearanceConfiguration.borderWidth)
        case .circle:
            RoundedRectangle(cornerRadius: RainbowDefaults.cornerRadius)
                .stroke(viewModel.currentStateAppearanceConfiguration.borderColor, lineWidth: viewModel.currentStateAppearanceConfiguration.borderWidth)
        }
    }
}

// MARK: - ViewModel

/// `RainbowFieldViewModel` is an `ObservableObject` responsible for managing the state, formatting, and validation of a text field.
///
/// It handles the formatting of text, validates the input according to specified rules, and updates its properties to reflect the text field's state. This enables reactive updates to the UI.
public class RainbowFieldViewModel: ObservableObject {
        
    /// Indicates whether the text field is enabled. When set to `false`, the text field is disabled and interactions are not allowed.
    @Published public var isEnabled: Bool = true
    
    /// The current text value of the field. This property automatically formats the text based on the formatter specified in the configuration.
    @Published public var text: String = ""
    
    /// Indicates whether the text field is currently focused. This property can be used to adjust the field's appearance when active.
    @Published public var isFocused: Bool = false
    
    /// Indicates whether the current text value meets the validation criteria specified in the configuration.
    @Published public var isValid: Bool = false
    
    /// A collection of validation messages related to the current text value. These messages provide feedback on the text's validity.
    @Published public var validationMessages: [String] = []
    
    // MARK: - Private Properties
    
    /// The configuration object that defines the appearance, formatting, and validation rules for the text field.
    public var configuration: RainbowFieldConfiguration
    
    // MARK: - Initialization
    
    /// Initializes a `RainbowFieldViewModel` instance with the specified configuration.
    ///
    /// - Parameter configuration: The configuration to apply for setting up the text field's appearance, formatting, and validation.
    public init(configuration: RainbowFieldConfiguration) {
        self.configuration = configuration
    }
    
    // MARK: - Computed Properties
    
    /// Provides the unformatted text value by removing any non-alphanumeric characters. This is useful for scenarios where the raw text is required.
    public var unformattedText: String {
        // Create a character set containing only alphanumeric characters (letters and digits).
        let allowedCharacters = CharacterSet.alphanumerics
        
        // Filter out any characters from the text that are not in the allowed character set.
        let filteredText = text.unicodeScalars.filter { allowedCharacters.contains($0) }
        
        // Convert the filtered unicode scalars back into a string and return it.
        return String(filteredText)
    }
    
    /// Determines and returns the appearance configuration based on the current state of the text field (idle, focused, valid, or invalid).
    ///
    /// - Returns: The `RainbowFieldStateAppearanceConfiguration` that represents the text field's appearance in its current state.
    public var currentStateAppearanceConfiguration: RainbowFieldStateAppearanceConfiguration {
        
        if isValid {
            return configuration.validStateAppearance
        }
        
        if !validationMessages.isEmpty {
            return configuration.invalidStateAppearance
        }
        
        if isFocused {
            return configuration.focusStateAppearance
        }
    
        return configuration.idleStateAppearance
    }
    
    // MARK: - Functions
    
    /// Validates the text input against the specified validation rules and updates the validation messages and validity state.
    public func validateText() {
        
        /// Check if valid
        validationMessages = configuration.validationRules.compactMap { rule in
            rule.validate(text) ? nil : rule.message
        }
        isValid = validationMessages.isEmpty
        
        /// Reset for next valid check onChange
        clearValidationRulesIfNeeded()
    }

    /// Clears validation messages if the text field is empty.
    public func clearValidationRulesIfNeeded() {
        if text.isEmpty {
            validationMessages = []
        }
    }
    
    public func reset() {
        /// No longer valid
        isValid = false

        /// Clear errors
        validationMessages = []
        
        /// Clear text
        text = ""
    }
}

// MARK: - Style
/// TODO: Move this to appropriate area once SPM stops being weird 😜

/// An enumeration that defines different styles for a Rainbow field.
public enum RainbowFieldStyle {
    /// The default style for the field.
    case `default`
    
    /// The Call-to-Action (CTA) style for the field.
    case cta
}
