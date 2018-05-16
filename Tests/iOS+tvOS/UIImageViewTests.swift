import XCTest
import UserInterface

class UIImageViewTests: XCTestCase {
  func testInitializer() {
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    XCTAssertEqual(imageView.contentMode, .scaleAspectFit)
  }
}
