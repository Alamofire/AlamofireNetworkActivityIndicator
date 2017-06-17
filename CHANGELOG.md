# Change Log
All notable changes to this project will be documented in this file.
`AlamofireNetworkActivityIndicator` adheres to [Semantic Versioning](http://semver.org/).

#### 2.x Releases
- `2.2.x` Releases - [2.2.0](#220)
- `2.1.x` Releases - [2.1.0](#210)
- `2.0.x` Releases - [2.0.0](#200) | [2.0.1](#201)

#### 1.x Releases
- `1.1.x` Releases - [1.1.0](#110)
- `1.0.x` Releases - [1.0.0](#100) | [1.0.1](#101)

---

## [2.2.0](https://github.com/Alamofire/AlamofireNetworkActivityIndicator/releases/tag/2.1.0)
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
