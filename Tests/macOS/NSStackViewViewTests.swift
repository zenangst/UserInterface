import XCTest
import UserInterface

class NSStackViewViewTests: XCTestCase {

  func testHorizontalStackView() {
    let viewA = NSView()
    let viewB = NSView()
    let stackView = NSStackView(.horizontal, alignment: .centerX,
                                spacing: 20, views: viewA, viewB)

    XCTAssertEqual(stackView.spacing, 20)
    XCTAssertEqual(stackView.alignment, .centerX)
    XCTAssertEqual(stackView.arrangedSubviews, [viewA, viewB])
  }

  func testVerticalStackView() {
    let viewA = NSView()
    let viewB = NSView()
    let viewC = NSView()
    let stackView = NSStackView(.vertical, alignment: .leading,
                                spacing: 10, views: [viewA, viewB, viewC])

    XCTAssertEqual(stackView.orientation, .vertical)
    XCTAssertEqual(stackView.spacing, 10)
    XCTAssertEqual(stackView.alignment, .leading)
    XCTAssertEqual(stackView.arrangedSubviews, [viewA, viewB, viewC])
  }
}
