# AlamofireNetworkActivityIndicator

[![Build Status](https://travis-ci.org/Alamofire/AlamofireNetworkActivityIndicator.svg)](https://travis-ci.org/Alamofire/AlamofireNetworkActivityIndicator)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/AlamofireNetworkActivityIndicator.svg)](https://img.shields.io/cocoapods/v/AlamofireNetworkActivityIndicator.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/AlamofireNetworkActivityIndicator.svg?style=flat)](http://cocoadocs.org/docsets/AlamofireNetworkActivityIndicator)
[![Twitter](https://img.shields.io/badge/twitter-@AlamofireSF-blue.svg?style=flat)](http://twitter.com/AlamofireSF)

Controls the visibility of the network activity indicator on iOS using Alamofire.

## Features

- [X] Automatic Management of Activity Indicator Visiblity
- [X] Delay Timers to Mitigate Flicker
- [X] Can Support `NSURLSession` Instances Not Managed by Alamofire
- [x] Comprehensive Test Coverage
- [x] [Complete Documentation](http://cocoadocs.org/docsets/AlamofireNetworkActivityIndicator)

## Requirements

- iOS 8.0+
- Xcode 7.3+

## Dependencies

- [Alamofire 3.3+](https://github.com/Alamofire/Alamofire)

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire). (Tag 'alamofire')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/alamofire).
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 0.39.0+ is required.

To integrate AlamofireNetworkActivityIndicator into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'AlamofireNetworkActivityIndicator', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate AlamofireNetworkActivityIndicator into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "Alamofire/AlamofireNetworkActivityIndicator" ~> 1.0
```

---

## Usage

The `NetworkActivityIndicatorManager` manages the state of the network activity indicator. To begin using it, all that is required is to enable the `sharedManager` in `application:didFinishLaunchingWithOptions:` in your `AppDelegate`.

```swift
NetworkActivityIndicatorManager.sharedManager.isEnabled = true
```

By enabling the `sharedManager` for the system, the network activity indicator will show and hide automatically as Alamofire requests start and complete.

### Notifications

The `NetworkActivityIndicatorManager` manages the currently active network request count by observing notifications emitted from Alamofire. By observing the task state changes, the `sharedManager` instance always knows how many requests are currently active and updates the visibility of the activity indicator accordingly.

> It is possible to have the `sharedManager` observe `NSURLSession` instances not inside Alamofire. You will need to emit matching notifications from the `NSURLSessionDelegate` matching those found in [Alamofire](https://github.com/Alamofire/Alamofire/blob/master/Source/Notifications.swift#L28-L44).

### Delay Timers

In order to make the activity indicator experience for a user as pleasant as possible, there need to be start and stop delays added in to avoid flickering. There are two such delay timers built into the `sharedManager`.

#### Start Delay

The start delay is a time interval indicating the minimum duration of networking activity that should occur before the activity indicator is displayed. This helps avoid needlessly displaying the indicator for really fast network requests. The default value is `1.0` second. You can easily change the default value if needed.

```swift
NetworkActivityIndicatorManager.sharedManager.startDelay = 1.0
```

#### Completion Delay

The completion delay is a time interval indicating the duration of time that no networking activity should be observed before dismissing the activity indicator. This allows the activity indicator to be continuously displayed between multiple network requests. Without this delay, the activity indicator tends to flicker. The default value is `0.2` seconds. You can easily change the default value if needed.

```swift
NetworkActivityIndicatorManager.sharedManager.completionDelay = 0.2
```

---

## FAQ

### Why is this not in Alamofire?

In order to allow Alamofire to continue to be used in App Extensions, this logic could not be included in the Alamofire framework. In order to submit an App Extension to the App Store, it can only be linked against frameworks that specify they only use App Extension safe APIs. Since we want users to be able to use Alamofire in App Extensions, we MUST set the `Require Only App Extension Safe APIs` to `true`. Because of this, we cannot call non-safe App Extension APIs in the Alamofire framework. Controlling the activity indicator on iOS is done through non-safe App Extension APIs. Because of this, a separate library needed to be created.

> But what about availability you say? Doesn't help in this case because availability checks still compile all the code. We could not use `#if os(iOS)` either because you cannot compile out logic specifically for iOS, but not for an iOS App Extension.

---

## Credits

Alamofire is owned and maintained by the [Alamofire Software Foundation](http://alamofire.org). You can follow them on Twitter at [@AlamofireSF](https://twitter.com/AlamofireSF) for project updates and releases.

## License

AlamofireNetworkActivityIndicator is released under the MIT license. See LICENSE for details.
