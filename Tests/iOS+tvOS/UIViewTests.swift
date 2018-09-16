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

  func testPinView() {
    let viewA = UIView()
    let viewB = UIView()
    let constraints = viewA.addSubview(viewB, pin: true,
                     insets: .init(top: 10, left: 10, bottom: 10, right: 10))

    guard constraints.count == 4 else {
      XCTFail("Wrong number of constraints")
      return
    }

    XCTAssertEqual(viewB.superview, viewA)

    do {
      let constraint = constraints[0]
      XCTAssertTrue(constraint.isActive)
      XCTAssertTrue((constraint.firstItem as? UIView) == viewB)
      XCTAssertTrue((constraint.secondItem as? UIView) == viewA)
    }
  }

  func testAddShadow() {
    let view = UIView()
    let color = UIColor.red
    let offset = CGSize.init(width: 0, height: 2)
    let opacity: Float = 0.75
    let radius: CGFloat = 8
    let shadow = Shadow(color: color, offset: offset, opacity: opacity, radius: radius)

    view.add(shadow)

    XCTAssertEqual(view.layer.shadowColor, color.cgColor)
    XCTAssertEqual(view.layer.shadowOffset, offset)
    XCTAssertEqual(view.layer.shadowOpacity, opacity)
    XCTAssertEqual(view.layer.shadowRadius, radius)
  }
}
