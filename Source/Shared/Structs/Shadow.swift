#if os(macOS)
import Cocoa
public typealias ShadowColor = NSColor
#else
import UIKit
public typealias ShadowColor = UIColor
#endif

public struct Shadow {
  let color: ShadowColor
  let offset: CGSize
  let opacity: Float
  let radius: CGFloat

  public init(color: ShadowColor, offset: CGSize = .zero,
              opacity: Float = 1.0, radius: CGFloat = 0.0) {
    self.color = color
    self.offset = offset
    self.opacity = opacity
    self.radius = radius
  }
}
