import UIKit

public extension UIImageView {
  public convenience init(image: UIImage? = nil,
                   contentMode: UIViewContentMode = .scaleToFill) {
    self.init(image: image)
    self.contentMode = contentMode
  }
}
