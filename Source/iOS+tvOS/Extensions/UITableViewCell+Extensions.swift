import UIKit

// Creates a unique identifier for a cell.
public extension UITableViewCell {
  /// A reuse identifier computed from the cell's own description.
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
