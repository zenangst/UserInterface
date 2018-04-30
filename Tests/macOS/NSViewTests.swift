import XCTest
import UserInterface

class NSViewTests: XCTestCase {
  func testAddingViews() {
    let viewA = NSView()
    let viewB = NSView()
    let viewC = NSView()

    let superview = NSView()
    superview.addSubviews(viewA, viewB, viewC)

    XCTAssertEqual(superview.subviews, [viewA, viewB, viewC])
  }
}
