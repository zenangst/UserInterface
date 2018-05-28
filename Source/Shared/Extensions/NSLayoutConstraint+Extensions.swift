#if os(macOS)
  import Cocoa
#else
  import UIKit
#endif

public extension NSLayoutConstraint {
  /// Add layout constraints to a view.
  ///
  /// - Parameters:
  ///   - activate: Indicates if the constraints should be activated or not.
  ///   - constraints: The constraints that should be applied.
  /// - Returns: The constraints that was applied to the view.
  @discardableResult public static func constrain(activate: Bool = true, _ constraints: NSLayoutConstraint?...) -> [NSLayoutConstraint] {
    for constraint in constraints {
      (constraint?.firstItem as? View)?.translatesAutoresizingMaskIntoConstraints = false
    }

    if activate {
      NSLayoutConstraint.activate(constraints.compactMap { $0 })
    }

    return constraints.compactMap { $0 }
  }

  /// Add view as a sub view an pin constraints to parent view.
  ///
  /// - Parameters:
  ///   - view: The view that should be added as a subview and pinned.
  ///   - toView: The view that the should act as the parent for constraints.
  ///   - activate: Indicates if the constraints should be activated or not.
  ///   - insets: Insets that are applied as constants for the constraints.
  /// - Returns: A collection of layout constraints.
  @discardableResult public static func addAndPin(_ view: View,
                                                  toView: View,
                                                  activate: Bool = true,
                                                  insets: EdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0))  -> [NSLayoutConstraint] {
    toView.addSubview(view)
    return pin(view, toView: toView, activate: activate, insets: insets)
  }

  /// Pin a view to another view using constraints.
  ///
  /// - Parameters:
  ///   - view: The view that should be pinned.
  ///   - toView: The view that the layout guide should be pinned to.
  ///   - activate: Indicates if the constraints should be activated or not.
  ///   - insets: Insets that are applied as constants for the constraints.
  /// - Returns: A collection of layout constraints.
  @discardableResult public static func pin(_ view: View,
                  toView: View,
                  activate: Bool = true,
                  insets: EdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) -> [NSLayoutConstraint] {
    let constraints = NSLayoutConstraint.constrain(activate: activate,
      view.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      view.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      view.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )

    return constraints.compactMap { $0 }
  }
}
