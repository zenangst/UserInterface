# UserInterface

[![CI Status](https://img.shields.io/circleci/project/github/zenangst/UserInterface.svg)](https://circleci.com/gh/zenangst/UserInterface)
[![Version](https://img.shields.io/cocoapods/v/UserInterface.svg?style=flat)](http://cocoadocs.org/docsets/UserInterface)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/UserInterface.svg?style=flat)](http://cocoadocs.org/docsets/UserInterface)
[![Platform](https://img.shields.io/cocoapods/p/UserInterface.svg?style=flat)](http://cocoadocs.org/docsets/UserInterface)
![Swift](https://img.shields.io/badge/%20in-swift%204.0-orange.svg)

## Description

<img src="https://github.com/zenangst/UserInterface/blob/master/Images/UserInterface-icon.png?raw=true" alt="UserInterface Icon" align="right" />

**UserInteface** is a collection of convenience extensions specifically tailored to building user interfaces in Swift. It acts as your faithful sidekick boosting your superpowers up to eleven. It covers things like registering cells on your reusable components, setting up constraints without reinventing the wheel and making stack views easier to build and maintain when building them in code.
The framework does not aim to solve everything, it aims to fix the most common hurdles based on personal experience.

## Usage

The methods described below use `UITableView` as the example, it works the same way for `UICollectionView`'s.
It has some additional properties for collection view layouts. To make life even easier, the methods also have macOS
equivalent so that you don't need to context switch when writing macOS code.

### Setting up and registering cells on reusable components
```swift
import UserInterface
let dataSource = DataSource()
let tableView = UITableView(dataSource: dataSource, register: Cell.self)
```
### Dequeuing cells in your data source
```swift
import UserInterface
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let model = model(at: indexPath) // Retrieves the model from an array.
  return tableView.dequeue(Cell.self, with: model(at: indexPath), for: indexPath) { view, model in
    view.textLabel?.text = model.name
  }
}
```

### Setting up constraints
```swift
NSLayoutConstraint.constrain(activate: true) {
  customView.centerXAnchor.constraint(equalTo: centerXAnchor),
  customView.centerYAnchor.constraint(equalTo: centerYAnchor)
}
```

### Pinning a custom view to its super view using constraints
```swift
NSLayoutConstraint.pin(customView, 
                       toView: superview, 
                       insets: .init(top: 0, left: 30, bottom: 0, right: -30))
```

### Adding multiple views
```swift
view.addSubviews(view1, view2, view3)
```

## Installation

**UserInterface** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UserInterface'
```

**UserInterface** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "zenangst/UserInterface"
```

**UserInterface** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Christoffer Winterkvist, christoffer@winterkvist.com

## Contributing

We would love you to contribute to **UserInterface**, check the [CONTRIBUTING](https://github.com/zenangst/UserInterface/blob/master/CONTRIBUTING.md) file for more info.

## License

**UserInterface** is available under the MIT license. See the [LICENSE](https://github.com/zenangst/UserInterface/blob/master/LICENSE.md) file for more info.
