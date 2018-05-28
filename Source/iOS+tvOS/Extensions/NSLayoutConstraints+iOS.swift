import UIKit

public extension NSLayoutConstraint {
  /// Add layoutGuide as a subview an pin constraints to parent view.
  ///
  /// - Parameters:
  ///   - layoutGuide: The layout guide that should be added and pinned.
  ///   - toView: The view that the should act as the parent for constraints.
  ///   - activate: Indicates if the constraints should be activated or not.
  ///   - insets: Insets that are applied as constants for the constraints.
  /// - Returns: A collection of layout constraints.
  @discardableResult public static func addAndPin(_ layoutGuide: UILayoutGuide,
                                                  toView: View,
                                                  activate: Bool = true,
                                                  insets: EdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0))  -> [NSLayoutConstraint] {
    toView.addLayoutGuide(layoutGuide)
    return pin(layoutGuide, toView: toView, activate: activate, insets: insets)
  }

  /// Pin a layout guide to a view using constraints.
  ///
  /// - Parameters:
  ///   - layoutGuide: The layout guide that should be pinned.
  ///   - toView: The view that the layout guide should be pinned to.
  ///   - activate: Indicates if the constraints should be activated or not.
  ///   - insets: Insets that are applied as constants for the constraints.
  /// - Returns: A collection of layout constraints.
  @discardableResult public static func pin(_ layoutGuide: UILayoutGuide,
                         toView: View,
                         activate: Bool = true,
                         insets: EdgeInsets = .zero) -> [NSLayoutConstraint] {
    let constraints = NSLayoutConstraint.constrain(activate: activate,
      layoutGuide.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      layoutGuide.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      layoutGuide.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      layoutGuide.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )

    return constraints.compactMap { $0 }
  }
}
