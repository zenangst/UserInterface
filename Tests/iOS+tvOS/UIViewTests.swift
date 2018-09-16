import XCTest
import UserInterface

class UIViewTests: XCTestCase {
  func testAddingViews() {
    let viewA = UIView()
    let viewB = UIView()
    let viewC = UIView()

    let superview = UIView()
    superview.addSubviews(viewA, viewB, viewC)

    XCTAssertEqual(superview.subviews, [viewA, viewB, viewC])
  }
}
