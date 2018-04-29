import UIKit

public extension UICollectionView {
  convenience init(dataSource: UICollectionViewDataSource? = nil,
                   layout: UICollectionViewLayout,
                   register cells: UICollectionViewCell.Type ...) {
    self.init(frame: .zero, collectionViewLayout: layout)
    cells.forEach { register($0) }
    self.dataSource = dataSource
  }

  public func register(_ type: UICollectionViewCell.Type) {
    register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
  }

  public func dequeue<T: UICollectionViewCell, M>(_ type: T.Type,
                                           with model: M,
                                           for indexPath: IndexPath,
                                           closure: ((T, M) -> Void)? = nil) -> T {
    if let cell = dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T {
      closure?(cell, model)
      return cell
    }
    assertionFailure("Failed to dequeue \(type)")
    return type.init()
  }
}
