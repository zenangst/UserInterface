import UIKit

public extension UICollectionView {
  /// Initialize a collection view with a data source, layout
  /// and cells that should be registred.
  ///
  /// - Parameters:
  ///   - dataSource: The data source that will be used.
  ///   - layout: The layout that will be used.
  ///   - cells: The cells that should be registred.
  convenience init(dataSource: UICollectionViewDataSource? = nil,
                   delegate: UICollectionViewDelegate? = nil,
                   layout: UICollectionViewLayout,
                   register cells: UICollectionViewCell.Type ...) {
    self.init(frame: .zero, collectionViewLayout: layout)
    cells.forEach { register($0) }
    self.dataSource = dataSource
    self.delegate = delegate
  }

  /// Register a cell(s) using the cells computed `.reuseIdentifier`.
  ///
  /// - Parameter types: The type(s) of cell that should be registred.
  public func register(_ types: UICollectionViewCell.Type ...) {
    register(types)
  }

  /// Register a cells using the cells computed `.reuseIdentifier`.
  ///
  /// - Parameter types: The type of cell that should be registred.
  public func register(_ types: [UICollectionViewCell.Type]) {
    types.forEach { type in register(type, forCellWithReuseIdentifier: type.reuseIdentifier) }
  }

  public func dequeue<T: UICollectionViewCell>(_ type: T.Type,
                                               for indexPath: IndexPath,
                                               then handler: ((T) -> Void)? = nil) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
      assertionFailure("Failed to dequeue \(type)")
      return type.init()
    }

    handler?(cell)
    return cell
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
  public func dequeue<T: UICollectionViewCell, M>(_ type: T.Type,
                                           with model: M,
                                           for indexPath: IndexPath,
                                           then handler: ((T, M) -> Void)? = nil) -> T {
    let cell = dequeue(type, for: indexPath, then: { cell in
      handler?(cell, model)
    })
    return cell
  }
}
