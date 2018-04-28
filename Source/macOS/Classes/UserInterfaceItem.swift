import Cocoa

open class UserInterfaceItem: NSCollectionViewItem {
  override open func loadView() {
    self.view = UserInterfaceView()
  }
}
