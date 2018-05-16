import XCTest
import UserInterface

class UILabelTests: XCTestCase {
  func testInitializer() {
    let color = UIColor.blue
    let font = UIFont.systemFont(ofSize: 32)
    let label = UILabel(text: "A",
                        font: font,
                        textColor: color,
                        textAlignment: .center,
                        numberOfLines: 2)

    XCTAssertEqual(label.text, "A")
    XCTAssertEqual(label.font, font)
    XCTAssertEqual(label.textColor, color)
    XCTAssertEqual(label.textAlignment, .center)
    XCTAssertEqual(label.numberOfLines, 2)
  }
}
