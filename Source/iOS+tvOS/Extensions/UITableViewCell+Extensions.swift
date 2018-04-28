import UIKit

public extension UITableViewCell {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
