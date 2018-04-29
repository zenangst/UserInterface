import Cocoa

public extension NSCollectionViewItem {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
