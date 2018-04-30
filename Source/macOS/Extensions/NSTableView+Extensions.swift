import Cocoa

public extension NSTableView {
  /// Initialize a table view with a data source.
  ///
  /// - Parameter dataSource: The data source that will be used.
  public convenience init(dataSource: NSTableViewDataSource? = nil) {
    self.init(frame: .zero)
    self.dataSource = dataSource
  }

  /// Dequeue and configure a cell at a specific index path.
  /// Commonly used inside the table view's data source.
  ///
  /// - Parameters:
  ///   - type: The type of cell.
  ///   - model: The model that should be used to configure the cell.
  ///   - indexPath: The index path of the cell.
  ///   - closure: The configuration closure for the cell.
  /// - Returns: A cell with a generically inferred type.
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
