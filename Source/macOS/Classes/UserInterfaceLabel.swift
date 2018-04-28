import Cocoa

open class UserInterfaceLabel: NSTextField {
  override open var isFlipped: Bool { return true }

  override open var isBezeled: Bool {
    get { return false }
    set { super.isBezeled = false }
  }
  override open var isEditable: Bool {
    get { return false }
    set { super.isEditable = false }
  }

  public var text: String {
    get { return stringValue }
    set { stringValue = newValue }
  }

  open override func viewWillMove(toSuperview newSuperview: NSView?) {
    super.viewWillMove(toSuperview: newSuperview)
    super.isBezeled = false
    super.isEditable = false
    super.backgroundColor = .clear
  }
}
