import SwiftUI

/// Orientation options for the RainbowToggleGroup.
public enum RainbowToggleGroupOrientation {
    case horizontal, vertical
}

/// Configuration object for the RainbowToggleGroup component.
public struct RainbowToggleGroupConfiguration {
    /// The orientation of the toggle group.
    public var orientation: RainbowToggleGroupOrientation
    
    /// The spacing between the toggles.
    public var spacing: CGFloat
    
    /// The configuration for individual toggles.
    public var toggleConfiguration: RainbowToggleConfiguration
    
    /// Initializes a new configuration object for the RainbowToggleGroup.
    /// - Parameters:
    ///   - orientation: The orientation of the toggle group.
    ///   - spacing: The spacing between the toggles.
    ///   - toggleConfiguration: The configuration for individual toggles.
    public init(orientation: RainbowToggleGroupOrientation = .vertical,
                spacing: CGFloat = 8.0,
                toggleConfiguration: RainbowToggleConfiguration = RainbowToggleConfiguration()) {
        self.orientation = orientation
        self.spacing = spacing
        self.toggleConfiguration = toggleConfiguration
    }
}

/// A group of RainbowToggle components arranged either horizontally or vertically.
public struct RainbowToggleGroup<Item: Identifiable & Hashable, Content: View>: View {
    
    @Binding public var selectedItems: Set<Item>
    public var items: [Item]
    public var itemContent: (Item) -> Content
    public var configuration: RainbowToggleGroupConfiguration
    
    /// Initializes a new RainbowToggleGroup.
    /// - Parameters:
    ///   - selectedItems: A binding to a set of selected items.
    ///   - items: The items to display in the toggle group.
    ///   - itemContent: A closure that provides the content for each item.
    ///   - configuration: The configuration for the toggle group.
    public init(selectedItems: Binding<Set<Item>>,
                items: [Item],
                @ViewBuilder itemContent: @escaping (Item) -> Content,
                configuration: RainbowToggleGroupConfiguration) {
        self._selectedItems = selectedItems
        self.items = items
        self.itemContent = itemContent
        self.configuration = configuration
    }
    
    private func isSelected(item: Item) -> Binding<Bool> {
        Binding<Bool>(
            get: { selectedItems.contains(item) },
            set: { isSelected in
                if isSelected {
                    selectedItems.insert(item)
                } else {
                    selectedItems.remove(item)
                }
            }
        )
    }
    
    public var body: some View {
        Group {
            if configuration.orientation == .horizontal {
                HStack(spacing: configuration.spacing) {
                    ForEach(items) { item in
                        HStack {
                            RainbowToggle(configuration.toggleConfiguration, isToggled: isSelected(item: item))
                            itemContent(item)
                        }
                        .onTapGesture {
                            withAnimation(configuration.toggleConfiguration.animation) {
                                toggleSelection(item: item)
                            }
                        }
                    }
                }
            } else {
                VStack(spacing: configuration.spacing) {
                    ForEach(items) { item in
                        HStack {
                            RainbowToggle(configuration.toggleConfiguration, isToggled: isSelected(item: item))
                            itemContent(item)
                        }
                        .onTapGesture {
                            withAnimation(configuration.toggleConfiguration.animation) {
                                toggleSelection(item: item)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func toggleSelection(item: Item) {
        if isSelected(item: item).wrappedValue {
            selectedItems.remove(item)
        } else {
            selectedItems.insert(item)
        }
    }
}
