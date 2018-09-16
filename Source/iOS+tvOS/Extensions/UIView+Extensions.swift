import UIKit

public extension UIView {
  public convenience init(backgroundColor: UIColor) {
    self.init()
    self.backgroundColor = backgroundColor
  }

  @discardableResult
  public func addSubview(_ view: UIView, pin: Bool = false, insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
    return NSLayoutConstraint.addAndPin(view, toView: self, insets: insets)
  }

  public func add(_ shadow: Shadow) {
    layer.shadowColor = shadow.color.cgColor
    layer.shadowRadius = shadow.radius
    layer.shadowOffset = shadow.offset
    layer.shadowOpacity = shadow.opacity
  }
}
