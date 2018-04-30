#if os(macOS)
  import Cocoa
#else
  import UIKit
#endif

public extension NSLayoutConstraint {
  @discardableResult public static func constrain(activate: Bool = true, _ constraints: NSLayoutConstraint?...) -> [NSLayoutConstraint?] {
    for constraint in constraints {
      (constraint?.firstItem as? View)?.translatesAutoresizingMaskIntoConstraints = false
    }

    if activate {
      NSLayoutConstraint.activate(constraints.compactMap { $0 })
    }

    return constraints
  }

  public static func pin(_ view: View,
                  toView: View,
                  activate: Bool = true,
                  insets: EdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)) -> [NSLayoutConstraint?] {
    let constraints = NSLayoutConstraint.constrain(activate: activate,
      view.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      view.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      view.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      view.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )

    return constraints
  }
}
