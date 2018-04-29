import Cocoa

public extension NSCollectionView {
  public convenience init(dataSource: NSCollectionViewDataSource? = nil,
                   layout: NSCollectionViewFlowLayout,
                   register cells: NSCollectionViewItem.Type ...) {
    self.init(frame: .zero)
    self.collectionViewLayout = layout
    cells.forEach { register($0) }
    self.dataSource = dataSource
  }

  public func register(_ type: NSCollectionViewItem.Type) {
    register(type, forItemWithIdentifier: NSUserInterfaceItemIdentifier(rawValue: type.reuseIdentifier))
  }

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
