import Cocoa

public extension NSTableRowView {
  /// A reuse identifier computed from the cell's own description.
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
