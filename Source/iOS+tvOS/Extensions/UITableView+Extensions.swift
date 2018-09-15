import UIKit

public extension UITableView {
  /// Initialize a table view with a data source and
  /// cells that should be registred.
  ///
  /// - Parameters:
  ///   - dataSource: The data source that will be used.
  ///   - cells: The cells that should be registred.
  public convenience init(dataSource: UITableViewDataSource? = nil,
                          delegate: UITableViewDelegate? = nil,
                          register cells: UITableViewCell.Type ...) {
    self.init(frame: .zero)
    cells.forEach { register($0) }
    self.dataSource = dataSource
    self.delegate = delegate
  }

  /// Register a cell(s) using the cells computed `.reuseIdentifier`.
  ///
  /// - Parameter types: The type(s) of cell that should be registred.
  public func register(_ types: UITableViewCell.Type ...) {
    register(types)
  }

  /// Register a cell(s) using the cells computed `.reuseIdentifier`.
  ///
  /// - Parameter types: The types of cell that should be registred.
  public func register(_ types: [UITableViewCell.Type]) {
    types.forEach { type in register(type, forCellReuseIdentifier: type.reuseIdentifier) }
  }

  public func dequeue<T: UITableViewCell>(_ type: T.Type,
                                               for indexPath: IndexPath,
                                               then handler: ((T) -> Void)? = nil) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
      assertionFailure("Failed to dequeue \(type)")
      return type.init()
    }

    handler?(cell)
    return cell
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
  public func dequeue<T: UITableViewCell, M>(_ type: T.Type,
                                      with model: M,
                                      for indexPath: IndexPath,
                                      then handler: ((T, M) -> Void)? = nil) -> T {
    let cell = dequeue(type, for: indexPath, then: { cell in
      handler?(cell, model)
    })
    return cell
  }
}
