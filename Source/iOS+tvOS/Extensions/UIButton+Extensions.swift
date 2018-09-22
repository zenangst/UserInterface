import UIKit

public extension UIButton {
  public convenience init(title: String,
                          type: UIButton.ButtonType = .system) {
    self.init(type: type)
    self.setTitle(title, for: .normal)
  }
}
