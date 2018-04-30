#if os(macOS)
  import Cocoa
#else
  import UIKit
#endif

public extension View {
  /// Adds multiple views to another view.
  ///
  /// - Parameter views: The views that should be added to the view.
  public func addSubviews(_ views: View...) {
    for view in views {
      addSubview(view)
    }
  }
}
