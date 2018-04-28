import UIKit

public extension UICollectionViewCell {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
