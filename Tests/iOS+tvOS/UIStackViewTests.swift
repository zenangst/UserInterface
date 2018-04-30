import XCTest
import UserInterface

class UIStackViewViewTests: XCTestCase {

  func testHorizontalStackView() {
    let viewA = UIView()
    let viewB = UIView()
    let stackView = UIStackView(.horizontal, alignment: .fill,
                                spacing: 20, views: viewA, viewB)

    XCTAssertEqual(stackView.axis, .horizontal)
    XCTAssertEqual(stackView.spacing, 20)
    XCTAssertEqual(stackView.alignment, .fill)
    XCTAssertEqual(stackView.arrangedSubviews, [viewA, viewB])
  }

  func testVerticalStackView() {
    let viewA = UIView()
    let viewB = UIView()
    let viewC = UIView()
    let stackView = UIStackView(.vertical, alignment: .leading,
                                spacing: 10, views: [viewA, viewB, viewC])

    XCTAssertEqual(stackView.axis, .vertical)
    XCTAssertEqual(stackView.spacing, 10)
    XCTAssertEqual(stackView.alignment, .leading)
    XCTAssertEqual(stackView.arrangedSubviews, [viewA, viewB, viewC])
  }
}
