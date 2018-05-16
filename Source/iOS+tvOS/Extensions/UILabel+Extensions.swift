import UIKit

public extension UILabel {
  public convenience init(text: String? = nil,
                   font: UIFont? = nil,
                   textColor: UIColor? = nil,
                   textAlignment: NSTextAlignment = .natural,
                   numberOfLines: Int = 0) {
    self.init()
    self.text = text
    if let font = font {
      self.font = font
    }
    self.textColor = textColor
    self.textAlignment = textAlignment
    self.numberOfLines = numberOfLines
  }
}
