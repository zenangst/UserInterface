import Cocoa

public extension NSStackView {
  /// Initialize a stack view with direction, alignment, spacing and views.
  ///
  /// - Parameters:
  ///   - orientation: The direction of the stack view, can be either horizontal
  ///                or vertical.
  ///   - alignment: The alignment of the stack view, defaults to `.centerX`.
  ///   - spacing: The spacing between the view.
  ///   - views: The views that should be added to the stack view.
  public convenience init(_ orientation: NSUserInterfaceLayoutOrientation = .horizontal,
                          alignment: NSLayoutConstraint.Attribute = .centerX,
                          spacing: CGFloat,
                          views: [View]) {
    self.init(views: views)
    self.orientation = orientation
    self.alignment = alignment
    self.spacing = spacing
  }

  /// Initialize a stack view with direction, alignment, spacing and views.
  ///
  /// - Parameters:
  ///   - orientation: The direction of the stack view, can be either horizontal
  ///                or vertical.
  ///   - alignment: The alignment of the stack view, defaults to `.centerX`.
  ///   - spacing: The spacing between the view.
  ///   - views: The views that should be added to the stack view.
  public convenience init(_ orientation: NSUserInterfaceLayoutOrientation = .horizontal,
                          alignment: NSLayoutConstraint.Attribute = .centerX,
                          spacing: CGFloat,
                          views: View...) {
    self.init(orientation, alignment: alignment, spacing: spacing, views: views)
  }
}
