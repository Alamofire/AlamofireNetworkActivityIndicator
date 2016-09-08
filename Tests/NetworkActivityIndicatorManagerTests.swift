//
//  NetworkActivityIndicatorManagerTests.swift
//
//  Copyright (c) 2016 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Alamofire
@testable import AlamofireNetworkActivityIndicator
import Foundation
import XCTest

class NetworkActivityIndicatorManagerTestCase: XCTestCase {
    let timeout = 10.0

    // MARK: - Tests - Manual Activity Count Updates

    func testThatManagerCanTurnOnAndOffIndicatorWhenManuallyIncrementingAndDecrementingActivityCount() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.0
        manager.completionDelay = 0.0

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        manager.incrementActivityCount()
        dispatchAfter(0.1) { manager.decrementActivityCount() }
        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertTrue(manager.isEnabled)
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    func testThatManagerCanTurnOnAndOffIndicatorWhenManuallyControllingActivityCountWithMultipleChanges() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.0
        manager.completionDelay = 0.0

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        manager.incrementActivityCount()
        dispatchAfter(0.05) { manager.incrementActivityCount() }
        dispatchAfter(0.10) { manager.decrementActivityCount() }
        dispatchAfter(0.15) { manager.decrementActivityCount() }

        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertTrue(manager.isEnabled)
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    func testThatManagerAppliesStartDelayWhenManuallyControllingActivityCount() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.1

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
        }

        // When
        manager.incrementActivityCount()
        dispatchAfter(0.05) { manager.decrementActivityCount() }

        let expectation = self.expectation(description: "visibility should change twice")
        dispatchAfter(0.1) { expectation.fulfill() }

        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertTrue(manager.isEnabled)
        XCTAssertTrue(visibilityStates.isEmpty)
    }

    func testThatManagerAppliesFinishDelayWhenManuallyControllingActivityCount() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.0
        manager.completionDelay = 0.2

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        manager.incrementActivityCount()
        dispatchAfter(0.1) { manager.decrementActivityCount() }
        dispatchAfter(0.2) { manager.incrementActivityCount() }
        dispatchAfter(0.3) { manager.decrementActivityCount() }

        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertTrue(manager.isEnabled)
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    func testThatManagerDoesNotTurnOnAndOffIndicatorWhenDisabled() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.isEnabled = false
        manager.startDelay = 0.0
        manager.completionDelay = 0.0

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
        }

        // When
        manager.incrementActivityCount()
        dispatchAfter(0.1) { manager.decrementActivityCount() }

        let expectation = self.expectation(description: "visibility should change twice")
        dispatchAfter(0.2) { expectation.fulfill() }

        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertFalse(manager.isEnabled)
        XCTAssertTrue(visibilityStates.isEmpty)
    }

    func testThatManagerIgnoresDecrementingActivityCountWhenAlreadyZero() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.0
        manager.completionDelay = 0.0

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
        }

        // When
        manager.incrementActivityCount()
        dispatchAfter(0.10) { manager.decrementActivityCount() }
        dispatchAfter(0.15) { manager.decrementActivityCount() }
        dispatchAfter(0.20) { manager.decrementActivityCount() }

        let expectation = self.expectation(description: "visibility should change twice")
        dispatchAfter(0.25) { expectation.fulfill() }

        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertTrue(manager.isEnabled)
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    // MARK: - Tests - Request Observation

    func testThatManagerCanTurnOnAndOffIndicatorWhenRequestSucceeds() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.0
        manager.completionDelay = 0.0

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        let _ = Alamofire.request("https://httpbin.org/delay/1")
        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    func testThatManagerCanTurnOnAndOffIndicatorWhenRequestFails() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.0
        manager.completionDelay = 0.0

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        let _ = Alamofire.request("https://httpbin.org/status/404")
        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    func testThatManagerAppliesVisibilityDelaysWhenMakingRequests() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 1.0
        manager.completionDelay = 1.0

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        let _ = Alamofire.request("https://httpbin.org/delay/2")
        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }

    func testThatManagerOnlyTurnsOnAndOffIndicatorOnceWhenMultipleRequestsAreMade() {
        // Given
        let manager = NetworkActivityIndicatorManager()
        manager.startDelay = 0.5
        manager.completionDelay = 0.5

        let expectation = self.expectation(description: "visibility should change twice")

        var visibilityStates: [Bool] = []

        manager.networkActivityIndicatorVisibilityChanged = { isVisible in
            visibilityStates.append(isVisible)
            if visibilityStates.count == 2 { expectation.fulfill() }
        }

        // When
        let _ = Alamofire.request("https://httpbin.org/delay/1")
        let _ = Alamofire.request("https://httpbin.org/delay/2")
        let _ = Alamofire.request("https://httpbin.org/delay/3")

        waitForExpectations(timeout: timeout, handler: nil)

        // Then
        XCTAssertEqual(visibilityStates.count, 2)

        if visibilityStates.count == 2 {
            XCTAssertTrue(visibilityStates[0])
            XCTAssertFalse(visibilityStates[1])
        }
    }
}

// MARK: -

private func dispatchAfter(_ seconds: TimeInterval, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { closure() }
}
