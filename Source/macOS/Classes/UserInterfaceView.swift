import Cocoa

open class UserInterfaceView: NSView {
  override open var isFlipped: Bool { return true }

  public var backgroundColor: NSColor? {
    get {
      guard let cgColor = layer?.backgroundColor else { return nil }
      return NSColor(cgColor: cgColor)
    }
    set {
      if newValue != nil { wantsLayer = true }
      layer?.backgroundColor = newValue?.cgColor
    }
  }
}
