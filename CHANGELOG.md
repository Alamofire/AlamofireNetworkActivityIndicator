# Change Log
All notable changes to this project will be documented in this file.
`AlamofireNetworkActivityIndicator` adheres to [Semantic Versioning](http://semver.org/).

#### 3.x Releases
- `3.0.0` Betas - [3.0.0-beta.1](#300-beta1) | [3.0.0-beta.2](#300-beta2) |  | [3.0.0-beta.3](#300-beta3)

#### 2.x Releases
- `2.4.x` Releases - [2.4.0](#240)
- `2.3.x` Releases - [2.3.0](#230)
- `2.2.x` Releases - [2.2.0](#220) | [2.2.1](#221)
- `2.1.x` Releases - [2.1.0](#210)
- `2.0.x` Releases - [2.0.0](#200) | [2.0.1](#201)

#### 1.x Releases
- `1.1.x` Releases - [1.1.0](#110)
- `1.0.x` Releases - [1.0.0](#100) | [1.0.1](#101)

---

## [3.0.0-beta.3](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/3.0.0-beta.3)
Released on 2019-05-04. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/13?closed=1).

#### Fixed
- Issue with AppStore submissions where the pre-release version in the bundle short versions string was being rejected when built with Carthage or as a submodule.
  - Fixed by [xGoPox](https://github.com/xGoPox) in Pull Request [#55](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/55).
- Issue in the Carthage installation instructions in the README.
  - Fixed by [Cícero Camargo](https://github.com/cicerocamargo) in Pull Request [#54](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/54).

## [3.0.0-beta.2](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/3.0.0-beta.2)
Released on 2019-04-13. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/12?closed=1).

#### Updated
- Project to require Alamofire 5.0.0-beta.5+ as a dependency.
  - Updated by [Christian Noon](https://github.com/cnoon) in Pull Request [#51](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/51).
- Activity tracking to monitor task events rather than request events to improve accuracy.
  - Updated by [Christian Noon](https://github.com/cnoon) in Pull Request [#52](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/52).

## [3.0.0-beta.1](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/3.0.0-beta.1)
Released on 2019-04-10. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/11?closed=1).

#### Added
- New `requestDidStart` and `requestDidStop` APIs based on `requestIDs` to replace the increment and decrement activity count APIs.
  - Added by [Christian Noon](https://github.com/cnoon) in Pull Request [#49](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/49).

#### Updated
- Project to use Swift 5 only and require Alamofire 5.0.0-beta.4+ as a dependency.
  - Updated by [Christian Noon](https://github.com/cnoon) in Pull Request [#48](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/48).

#### Fixed
- Issue where activity count could become negative causing the network activity indicator to not display correctly.
  - Fixed by [Christian Noon](https://github.com/cnoon) in regards to Issue [#38](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/issues/38) in Pull Request [#49](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/49).

---

## [2.4.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.4.0)
Released on 2019-04-06. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/10?closed=1).

#### Updated
- Project to use Swift 4 as the default language version for compatiblity with the Swift 5 compiler and Xcode 10.2.
  - Updated by [Ryan Zulkoski](https://github.com/rzulkoski) in Pull Request [#44](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/44).

--

## [2.3.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.3.0)
Released on 2018-09-15. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/9?closed=1).

#### Updated
- Code and dependencies for Xcode 10 and Swift 4.2.
  - Updated by [Jon Shier](https://github.com/jshier) in Pull Request [#42](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/42).

#### Fixed
- Bitcode settings.
  - Fixed by [Jaehong Kang](https://github.com/sinoru) in Pull Request [#35](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/35).

--

## [2.2.1](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.2.1)
Released on 2018-03-31. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/8?closed=1).

#### Added
- Jazzy docs.
  - Added by [Jon Shier](https://github.com/jshier) in Pull Request [#28](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/28).
- Pull request and issue templates.
  - Added by [Jon Shier](https://github.com/jshier) in Pull Request [#28](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/28).

#### Updated
- Project settings and dependencies for Xcode 9.3 and Swift 4.1.
  - Updated by [Jon Shier](https://github.com/jshier) in Pull Request [#33](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/33).

#### Fixed
- Swift Package Manager integration by removing Swift Package Manager support.
  - Fixed by [Jon Shier](https://github.com/jshier) in Pull Request [#28](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/28).

## [2.2.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.2.0)
Released on 2017-06-16. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/7?closed=1).

#### Updated
- The Alamofire submodule to the 4.5.0 release along with all dependency requirements.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Updated all project settings to Xcode 9 for support for Swift 3.1, 3.2, and 4.0.
  - Updated by [Christian Noon](https://github.com/cnoon).

#### Fixed
- Issues and typos throughout the README documentation and sample code and source code docstrings.
  - Fixed by
  [Eric Horstmanshof](https://github.com/Erulezz),
  [Martin Arista](https://github.com/mrtnrst), and
  [Wolfgang Lutz](https://github.com/Lutzifer) in Pull Requests
  [#21](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/21),
  [#24](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/24), and
  [#25](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/pull/25).

---

## [2.1.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.1.0)
Released on 2016-11-20. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/5?closed=1).

#### Updated
- The deployment targets to iOS 8.0 and macOS 10.10 and updated project settings.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The Alamofire submodule to the 4.2.0 release.
  - Updated by [Christian Noon](https://github.com/cnoon).

---

## [2.0.1](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.0.1)
Released on 2016-10-01. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/6?closed=1).

#### Added
- New `.swift-version` file to repo and reactivated `pod lib lint` in Travis file.
  - Added by [Christian Noon](https://github.com/cnoon).
- The `OS_ACTIVITY_MODE` environment variable to disable excessive logging.
  - Added by [Christian Noon](https://github.com/cnoon).

#### Updated
- The Alamofire submodule to the 4.0.1 release.
  - Updated by [Christian Noon](https://github.com/cnoon).

#### Fixed
- Issue where delay timers were being added to main run loop from non-main queues.
  - Fixed by [Christian Noon](https://github.com/cnoon) in regards to Issue
  [#16](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/issues/16).
- Issue where spinner could be left up indefinitely due to decrement race condition.
  - Fixed by [Christian Noon](https://github.com/cnoon) in regards to Issue
  [#14](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/issues/14).

## [2.0.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.0.0)
Released on 2016-09-11. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/milestone/4?closed=1).

#### Updated
- All source, test and example logic as well as project settings to compile against
  the Xcode 8 beta releases.
  - Updated by [Christian Noon](https://github.com/cnoon) and
    [Jon Shier](https://github.com/jshier).
- Deployment target and README requirements to iOS 9.0.
  - Updated by [Christian Noon](https://github.com/cnoon).
- All source and test APIs to match Swift 3 design guidelines.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The Cartfile and the Alamofire submodule to the 4.0.0 release.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The docstrings to use the new Swift 3 formatting guidelines.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The podspec version to 2.0.0 and bumped deployment target and dependency.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Project settings by running Swift 3 conversion tool and setting
  ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES to YES.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The travis-ci yaml file to build against Xcode 8 osx_image.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Code signing to automatic with no team and updated code signing identities.
  - Updated by [Christian Noon](https://github.com/cnoon).

---

## [1.1.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/1.1.0)
Released on 2016-09-08. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/issues?utf8=✓&q=milestone%3A1.1.0).

#### Updated
- The build status badge in the README now only reports the status of the `master` branch.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The source, test and example code along with project settings to support Swift 2.2
  and Swift 2.3 simultaneously.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Updated the travis yaml file for Swift 2.3 and the new OS target versions.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Updated the Cartfile and Alamofire submodule to the 3.5.0 release.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Updated Xcode project settings based on Xcode 8 GM recommendations.
  - Updated by [Christian Noon](https://github.com/cnoon).
- Code coverage generation is now disabled on framework targets to improve stability.
  - Updated by [Christian Noon](https://github.com/cnoon).

---

## [1.0.1](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/1.0.1)
Released on 2016-03-23. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/issues?utf8=✓&q=milestone%3A1.0.1).

#### Updated
- The Alamofire submodule to the 3.3.0 release along with the Cartfile
  and Podspec dependencies.
  - Updated by [Christian Noon](https://github.com/cnoon).
- All source code, tests and example logic to use Swift 2.2 conventions.
  - Updated by [Christian Noon](https://github.com/cnoon).
- The required version of Xcode to 7.3 in the README.
  - Updated by [Christian Noon](https://github.com/cnoon).

## [1.0.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/1.0.0)
Released on 2016-02-07. All issues associated with this milestone can be found using this
[filter](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/issues?utf8=✓&q=milestone%3A1.0.0).

#### Added
- Initial release of AlamofireNetworkActivityIndicator.
  - Added by [Christian Noon](https://github.com/cnoon).
