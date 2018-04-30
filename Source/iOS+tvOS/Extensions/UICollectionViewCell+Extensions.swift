import UIKit

public extension UICollectionViewCell {
  /// A reuse identifier computed from the cell's own description.
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
