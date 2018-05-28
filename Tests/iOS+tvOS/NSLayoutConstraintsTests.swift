import XCTest
import UserInterface

class NSLayoutConstraintsTests: XCTestCase {
  func testPinningView() {
    let viewA = UIView()
    let viewB = UIView()
    viewB.addSubview(viewA)
    let constraints = NSLayoutConstraint.pin(viewA, toView: viewB, insets: .init(top: 10, left: 10, bottom: 10, right: 10))

    XCTAssertEqual(constraints[0].constant, 10)
    XCTAssertEqual(constraints[1].constant, -10)
    XCTAssertEqual(constraints[2].constant, 10)
    XCTAssertEqual(constraints[3].constant, -10)
  }

  func testConstraints() {
    let viewA = UIView()
    let viewB = UIView()
    viewB.addSubview(viewA)

    let constraints = NSLayoutConstraint.constrain(activate: false,
      viewA.centerXAnchor.constraint(equalTo: viewB.centerXAnchor),
      viewA.centerYAnchor.constraint(equalTo: viewB.centerYAnchor)
    )

    XCTAssertEqual(constraints.count, 2)

    XCTAssertEqual(constraints[0].isActive, false)
    XCTAssertEqual(constraints[0].firstAnchor, viewA.centerXAnchor)
    XCTAssertEqual(constraints[0].secondAnchor, viewB.centerXAnchor)

    XCTAssertEqual(constraints[1].isActive, false)
    XCTAssertEqual(constraints[1].firstAnchor, viewA.centerYAnchor)
    XCTAssertEqual(constraints[1].secondAnchor, viewB.centerYAnchor)
  }

  func testAddAndPinView() {
    let pinnedView = UIView()
    let view = UIView()
    let constraints = NSLayoutConstraint.addAndPin(pinnedView, toView: view)

    XCTAssertEqual(constraints.count, 4)
  }

  func testConstrainingLayoutGuide() {
    let layoutGuide = UILayoutGuide()
    let view = UIView()
    view.addLayoutGuide(layoutGuide)
    let constraints = NSLayoutConstraint.pin(layoutGuide, toView: view)

    XCTAssertEqual(constraints.count, 4)
  }

  func testAddAndPinLayoutGuide() {
    let layoutGuide = UILayoutGuide()
    let view = UIView()
    let constraints = NSLayoutConstraint.addAndPin(layoutGuide, toView: view)

    XCTAssertEqual(constraints.count, 4)
    XCTAssertEqual(layoutGuide.owningView, view)
  }
}
