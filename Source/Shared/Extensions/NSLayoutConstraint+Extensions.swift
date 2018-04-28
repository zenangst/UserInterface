#if os(macOS)
  import Cocoa
#else
  import UIKit
#endif

public extension NSLayoutConstraint {
  public static func constrain(_ constraints: NSLayoutConstraint?...) {
    for constraint in constraints {
      (constraint?.firstItem as? View)?.translatesAutoresizingMaskIntoConstraints = false
    }

    NSLayoutConstraint.activate(constraints.compactMap { $0 })
  }

  public static func pin(_ view: View,
                  toView: View,
                  insets: EdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) {
    NSLayoutConstraint.constrain(
      view.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      view.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      view.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )
  }
}
