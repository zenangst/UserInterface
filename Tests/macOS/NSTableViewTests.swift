import XCTest
import UserInterface

class NSTableViewViewTests: XCTestCase {
  class DataSourceMock: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    let models = ["A", "B", "C"]

    func numberOfRows(in tableView: NSTableView) -> Int {
      return models.count
    }

    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
      let view = NSTableRowView()
      return view
    }
  }


  func testInitCollectionView() {
    let dataSource = DataSourceMock()
    let tableView = NSTableView(dataSource: dataSource)
    tableView.delegate = dataSource
    tableView.frame.size = CGSize(width: 250, height: 250)
    tableView.layout()
    tableView.setNeedsDisplay()
    XCTAssertEqual(tableView.rows(in: tableView.frame).length, dataSource.models.count)
  }
}
