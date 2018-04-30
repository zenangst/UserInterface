import Cocoa

public extension NSCollectionViewItem {
  /// A reuse identifier computed from the cell's own description.
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
