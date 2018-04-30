import UIKit

public extension NSLayoutConstraint {
  @discardableResult public static func pin(_ layoutGuide: UILayoutGuide,
                         toView: View,
                         activate: Bool = true,
                         insets: EdgeInsets = .zero) -> [NSLayoutConstraint?] {
    let constraints = NSLayoutConstraint.constrain(activate: activate,
      layoutGuide.leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: insets.left),
      layoutGuide.trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: -insets.right),
      layoutGuide.topAnchor.constraint(equalTo: toView.topAnchor, constant: insets.top),
      layoutGuide.bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: -insets.bottom)
    )

    return constraints
  }
}
