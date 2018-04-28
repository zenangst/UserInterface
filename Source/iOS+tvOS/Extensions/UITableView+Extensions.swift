import UIKit

public extension UITableView {
  public convenience init(dataSource: UITableViewDataSource? = nil,
                   register cells: UITableViewCell.Type ...) {
    self.init(frame: .zero)
    cells.forEach { register($0) }
    self.dataSource = dataSource
  }

  public func register(_ type: UITableViewCell.Type) {
    register(type, forCellReuseIdentifier: type.reuseIdentifier)
  }

  public func dequeue<T: UITableViewCell, M>(_ type: T.Type,
                                      with model: M,
                                      for indexPath: IndexPath,
                                      closure: ((T, M) -> Void)? = nil) -> T {
    if let cell = dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T {
      closure?(cell, model)
      return cell
    }
    assertionFailure("Failed to dequeue \(type)")
    return type.init()
  }
}
