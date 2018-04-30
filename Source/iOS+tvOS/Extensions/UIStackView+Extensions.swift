import UIKit

public extension UIStackView {
  /// Initialize a stack view with direction, alignment, spacing and views.
  ///
  /// - Parameters:
  ///   - direction: The direction of the stack view, can be either horizontal
  ///                or vertical.
  ///   - alignment: The alignment of the stack view, defaults to `.fill`.
  ///   - spacing: The spacing between the view.
  ///   - views: The views that should be added to the stack view.
  public convenience init(_ direction: UILayoutConstraintAxis = .horizontal,
                   alignment: UIStackViewAlignment = .fill,
                   spacing: CGFloat,
                   views: [UIView]) {
    self.init(arrangedSubviews: views)
    self.axis = direction
    self.alignment = alignment
    self.spacing = spacing
  }

  /// Initialize a stack view with direction, alignment, spacing and views.
  ///
  /// - Parameters:
  ///   - direction: The direction of the stack view, can be either horizontal
  ///                or vertical.
  ///   - alignment: The alignment of the stack view, defaults to `.fill`.
  ///   - spacing: The spacing between the view.
  ///   - views: The views that should be added to the stack view.
  public convenience init(_ direction: UILayoutConstraintAxis = .horizontal,
                   alignment: UIStackViewAlignment = .fill,
                   spacing: CGFloat,
                   views: UIView ...) {
    self.init(direction, alignment: alignment, spacing: spacing, views: views)
  }
}
