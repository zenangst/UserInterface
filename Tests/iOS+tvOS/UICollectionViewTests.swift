import XCTest
import UserInterface

class UICollectionViewTests: XCTestCase {
  class DataSourceMock: NSObject, UICollectionViewDataSource {
    let models = ["A", "B", "C"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      return collectionView.dequeue(UICollectionViewCell.self, with: models[indexPath.item], for: indexPath) { (_,_) in }
    }
  }


  func testInitCollectionView() {
    let dataSource = DataSourceMock()
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: 50, height: 50)
    let collectionView = UICollectionView(dataSource: dataSource, layout: layout, register: UICollectionViewCell.self)
    collectionView.frame.size = CGSize(width: 250, height: 250)
    collectionView.setNeedsLayout()
    collectionView.layoutIfNeeded()

    XCTAssertEqual(collectionView.visibleCells.count, dataSource.models.count)
  }
}
