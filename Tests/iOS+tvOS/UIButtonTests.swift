import XCTest
import UserInterface

class UIIButtonTests: XCTestCase {
  func testInitializer() {
    let buttonA = UIButton(title: "A", type: .system)
    let buttonB = UIButton(title: "B", type: .custom)

    XCTAssertEqual(buttonA.titleLabel?.text, "A")
    XCTAssertEqual(buttonA.buttonType, .system)

    XCTAssertEqual(buttonB.titleLabel?.text, "B")
    XCTAssertEqual(buttonB.buttonType, .custom)
  }
}
