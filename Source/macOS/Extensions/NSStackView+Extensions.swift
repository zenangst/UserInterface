import Cocoa

public extension NSStackView {
  public convenience init(_ orientation: NSUserInterfaceLayoutOrientation = .horizontal,
                          alignment: NSLayoutConstraint.Attribute = .centerX,
                          spacing: CGFloat,
                          views: [View]) {
    self.init(views: views)
    self.orientation = orientation
    self.alignment = alignment
    self.spacing = spacing
  }

  public convenience init(_ orientation: NSUserInterfaceLayoutOrientation = .horizontal,
                          alignment: NSLayoutConstraint.Attribute = .centerX,
                          spacing: CGFloat,
                          views: View...) {
    self.init(orientation, alignment: alignment, spacing: spacing, views: views)
  }
}
