import XCTest
import UserInterface

class NSCollectionViewTests: XCTestCase {
  class DataSourceMock: NSObject, NSCollectionViewDataSource {
    let models = ["A", "B", "C"]

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
      return models.count
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
      return collectionView.dequeue(UserInterfaceItem.self, with: models[indexPath.item], for: indexPath) { (_,_) in }
    }
  }


  func testInitCollectionView() {
    let dataSource = DataSourceMock()
    let layout = NSCollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 50, height: 50)
    let collectionView = NSCollectionView(dataSource: dataSource, layout: layout, register: UserInterfaceItem.self)
    collectionView.frame.size = CGSize(width: 250, height: 250)
    collectionView.layout()

    XCTAssertEqual(collectionView.visibleItems().count, dataSource.models.count)
  }
}
