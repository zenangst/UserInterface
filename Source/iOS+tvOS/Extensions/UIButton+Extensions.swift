import UIKit

public extension UIButton {
  public convenience init(title: String,
                          type: UIButtonType = .system) {
    self.init(type: type)
    self.setTitle(title, for: .normal)
  }
}
