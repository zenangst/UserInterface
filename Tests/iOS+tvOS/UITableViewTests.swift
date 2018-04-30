import XCTest
import UserInterface

class UITableViewViewTests: XCTestCase {
  class DataSourceMock: NSObject, UITableViewDataSource {
    let models = ["A", "B", "C"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return tableView.dequeue(UITableViewCell.self, with: models[indexPath.item], for: indexPath) { (_,_) in }
    }
  }


  func testInitCollectionView() {
    let dataSource = DataSourceMock()
    let tableView = UITableView(dataSource: dataSource, register: UITableViewCell.self)
    tableView.frame.size = CGSize(width: 250, height: 250)
    tableView.setNeedsLayout()
    tableView.layoutIfNeeded()

    XCTAssertEqual(tableView.visibleCells.count, dataSource.models.count)
  }
}
