import Cocoa

public extension NSTableView {
  public convenience init(dataSource: NSTableViewDataSource? = nil) {
    self.init(frame: .zero)
    self.dataSource = dataSource
  }

  public func dequeue<T: NSTableRowView, M>(_ type: T.Type,
                                             with model: M,
                                             for indexPath: IndexPath,
                                             closure: ((T, M) -> Void)? = nil) -> T {
    let identifier = NSUserInterfaceItemIdentifier(rawValue: type.reuseIdentifier)

    if let cell = makeView(withIdentifier: identifier, owner: nil) as? T {
      closure?(cell, model)
      return cell
    }
    assertionFailure("Failed to dequeue \(type)")
    return type.init()
  }
}
