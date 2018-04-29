#if os(macOS)
  import Cocoa
  public typealias View = NSView
  public typealias EdgeInsets = NSEdgeInsets
#else
  import UIKit
  public typealias View = UIView
  public typealias EdgeInsets = UIEdgeInsets
#endif
