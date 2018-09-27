#if os(macOS)
  import Cocoa
#else
  import UIKit
#endif

public extension View {
  /// Adds multiple views to another view.
  ///
  /// - Parameter views: The views that should be added to the view.
  public func addSubviews(_ views: View...) {
    for view in views {
      addSubview(view)
    }
  }

  @discardableResult
  /// Adds a view to the view’s subviews so it’s displayed above its siblings.
  /// Optionally pin the view to its superview using layout constraints.
  ///
  /// - Parameters:
  ///   - view: The view to add to the view as a subview.
  ///   - pin: Indicates if the view should be pinned using constraints.
  ///   - insets: Insets used to apply padding when applying constraints.
  /// - Returns: A collection of layout constraints, the array is empty if
  ///            `pin` is set to `false`.
  public func addSubview(_ view: View, pin: Bool = false, insets: EdgeInsets = .init()) -> [NSLayoutConstraint] {
    if pin {
      return NSLayoutConstraint.addAndPin(view, toView: self, insets: insets)
    } else {
      self.addSubview(view)
      return []
    }
  }
}
