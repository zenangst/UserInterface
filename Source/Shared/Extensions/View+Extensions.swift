#if os(macOS)
  import Cocoa
#else
  import UIKit
#endif

public extension View {
  public func addSubviews(_ views: View...) {
    for view in views {
      addSubview(view)
    }
  }
}
