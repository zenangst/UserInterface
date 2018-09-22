import UIKit

public extension UIImageView {
  public convenience init(image: UIImage? = nil,
                          contentMode: UIView.ContentMode = .scaleToFill) {
    self.init(image: image)
    self.contentMode = contentMode
  }
}
