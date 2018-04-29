import Cocoa

public extension NSTableRowView {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}
