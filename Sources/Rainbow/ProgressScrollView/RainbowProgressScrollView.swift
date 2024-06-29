import SwiftUI

#if os(iOS) || os(tvOS)
/// A view that represents a scrollable content area with progress tracking for iOS and tvOS.
public struct RainbowScrollProgressView<Content: View>: UIViewRepresentable {
    @Binding var progress: CGFloat
    let content: Content

    /// Initializes a new instance of `RainbowScrollProgressView`.
    ///
    /// - Parameters:
    ///   - progress: A binding to the progress value.
    ///   - content: A view builder that provides the content to be displayed inside the scroll view.
    public init(progress: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._progress = progress
        self.content = content()
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        
        // Enable scrolling interaction on tvOS
       #if os(tvOS)
       scrollView.panGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.indirect.rawValue)]
       #endif

        let hostingController = UIHostingController(rootView: content)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(hostingController.view)

        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostingController.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        return scrollView
    }

    public func updateUIView(_ uiView: UIScrollView, context: Context) {
        // No need to update the view here
    }

    public class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: RainbowScrollProgressView

        init(_ parent: RainbowScrollProgressView) {
            self.parent = parent
        }

        public func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let contentHeight = scrollView.contentSize.height - scrollView.bounds.height
            let offset = scrollView.contentOffset.y
            let progress = min(max(offset / contentHeight, 0), 1)
            parent.progress = progress
        }
    }
}
#endif

#if os(macOS)
import Cocoa

/// A custom `NSClipView` subclass that flips the coordinate system.
class FlippedClipView: NSClipView {
    override var isFlipped: Bool {
        return true
    }
}

/// A view that represents a scrollable content area with progress tracking for macOS.
public struct RainbowScrollProgressView<Content: View>: NSViewRepresentable {
    
    @Binding var progress: CGFloat
    let content: Content

    /// Initializes a new instance of `RainbowScrollProgressView`.
    ///
    /// - Parameters:
    ///   - progress: A binding to the progress value.
    ///   - content: A view builder that provides the content to be displayed inside the scroll view.
    public init(progress: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._progress = progress
        self.content = content()
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSScrollView()
        scrollView.hasVerticalScroller = true
        
        // Use the custom FlippedClipView
        scrollView.contentView = FlippedClipView()

        let hostingView = NSHostingView(rootView: content)
        hostingView.translatesAutoresizingMaskIntoConstraints = false

        let documentView = NSView()
        documentView.translatesAutoresizingMaskIntoConstraints = false
        documentView.addSubview(hostingView)

        scrollView.documentView = documentView

        NSLayoutConstraint.activate([
            hostingView.leadingAnchor.constraint(equalTo: documentView.leadingAnchor),
            hostingView.trailingAnchor.constraint(equalTo: documentView.trailingAnchor),
            hostingView.topAnchor.constraint(equalTo: documentView.topAnchor),
            hostingView.bottomAnchor.constraint(equalTo: documentView.bottomAnchor),
            hostingView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        scrollView.contentView.postsBoundsChangedNotifications = true

        NotificationCenter.default.addObserver(
            context.coordinator,
            selector: #selector(Coordinator.boundsDidChange),
            name: NSView.boundsDidChangeNotification,
            object: scrollView.contentView
        )

        return scrollView
    }

    public func updateNSView(_ nsView: NSScrollView, context: Context) {
        // No need to adjust the bounds manually
    }

    public class Coordinator: NSObject {
        var parent: RainbowScrollProgressView

        init(_ parent: RainbowScrollProgressView) {
            self.parent = parent
        }

        @objc func boundsDidChange(_ notification: Notification) {
            guard let scrollView = notification.object as? NSClipView,
                  let documentView = scrollView.documentView else { return }
            let contentHeight = documentView.frame.height - scrollView.bounds.height
            let offset = scrollView.bounds.origin.y
            let progress = min(max(offset / contentHeight, 0), 1) // Calculate progress in the correct direction
            parent.progress = progress
        }

        deinit {
            NotificationCenter.default.removeObserver(self)
        }
    }
}
#endif
