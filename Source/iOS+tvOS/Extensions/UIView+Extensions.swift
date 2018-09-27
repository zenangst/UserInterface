import UIKit

public extension UIView {
  public convenience init(backgroundColor: UIColor) {
    self.init()
    self.backgroundColor = backgroundColor
  }

  public func add(_ shadow: Shadow) {
    layer.shadowColor = shadow.color.cgColor
    layer.shadowRadius = shadow.radius
    layer.shadowOffset = shadow.offset
    layer.shadowOpacity = shadow.opacity
  }
}
