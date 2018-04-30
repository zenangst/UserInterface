import Cocoa

public extension NSCollectionView {
  /// Initialize a collection view with a data source, layout
  /// and cells that should be registred.
  ///
  /// - Parameters:
  ///   - dataSource: The data source that will be used.
  ///   - layout: The layout that will be used.
  ///   - cells: The cells that should be registred.
  public convenience init(dataSource: NSCollectionViewDataSource? = nil,
                   layout: NSCollectionViewFlowLayout,
                   register cells: NSCollectionViewItem.Type ...) {
    self.init(frame: .zero)
    self.collectionViewLayout = layout
    cells.forEach { register($0) }
    self.dataSource = dataSource
  }

  /// Register a cell using the cells computed `.reuseIdentifier`.
  ///
  /// - Parameter type: The type of cell that should be registred.
  public func register(_ type: NSCollectionViewItem.Type) {
    register(type, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: type.reuseIdentifier))
  }

  /// Dequeue and configure a cell at a specific index path.
  /// Commonly used inside the collection view's data source.
  ///
  /// - Parameters:
  ///   - type: The type of cell.
  ///   - model: The model that should be used to configure the cell.
  ///   - indexPath: The index path of the cell.
  ///   - closure: The configuration closure for the cell.
  /// - Returns: A cell with a generically inferred type.
  public func dequeue<T: NSCollectionViewItem, M>(_ type: T.Type,
                                                  with model: M,
                                                  for indexPath: IndexPath,
                                                  closure: ((T, M) -> Void)? = nil) -> T {
    let identifier = NSUserInterfaceItemIdentifier(rawValue: type.reuseIdentifier)
    if let cell = makeItem(withIdentifier: identifier, for: indexPath) as? T {
      closure?(cell, model)
      return cell
    }
    assertionFailure("Failed to dequeue \(type)")
    return type.init()
  }
}
