// NetworkActivityIndicatorManager.swift
//
// Copyright (c) 2016 Alamofire Software Foundation (http://alamofire.org/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Alamofire
import Foundation
import UIKit

public class NetworkActivityIndicatorManager {
    private enum ActivityIndicatorState {
        case NotActive, DelayingStart, Active, DelayingCompletion
    }

    // MARK: - Properties

    public static let sharedManager = NetworkActivityIndicatorManager()

    public var isEnabled: Bool {
        get {
            lock.lock() ; defer { lock.unlock() }
            return enabled
        }
        set {
            lock.lock() ; defer { lock.unlock() }
            enabled = newValue
        }
    }

    public private(set) var isNetworkActivityIndicatorVisible: Bool = false {
        didSet {
            guard isNetworkActivityIndicatorVisible != oldValue else { return }

            dispatch_async(dispatch_get_main_queue()) {
                let app = UIApplication.sharedApplication()
                app.networkActivityIndicatorVisible = self.isNetworkActivityIndicatorVisible

                self.networkActivityIndicatorVisibilityChanged?(self.isNetworkActivityIndicatorVisible)
            }
        }
    }

    public var networkActivityIndicatorVisibilityChanged: (Bool -> Void)?

    public var startDelay: NSTimeInterval = 1.0
    public var completionDelay: NSTimeInterval = 0.2

    private var activityIndicatorState: ActivityIndicatorState = .NotActive {
        didSet {
            switch activityIndicatorState {
            case .NotActive:
                isNetworkActivityIndicatorVisible = false
                invalidateStartDelayTimer()
                invalidateCompletionDelayTimer()
            case .DelayingStart:
                scheduleStartDelayTimer()
            case .Active:
                invalidateCompletionDelayTimer()
                isNetworkActivityIndicatorVisible = true
            case .DelayingCompletion:
                scheduleCompletionDelayTimer()
            }
        }
    }

    private var activityCount: Int = 0
    private var enabled: Bool = true

    private var startDelayTimer: NSTimer?
    private var completionDelayTimer: NSTimer?

    private let lock = NSLock()

    // MARK: - Internal - Initialization

    init() {
        registerForNotifications()
    }

    deinit {
        unregisterForNotifications()

        invalidateStartDelayTimer()
        invalidateCompletionDelayTimer()
    }

    // MARK: - Activity Count

    public func incrementActivityCount() {
        lock.lock() ; defer { lock.unlock() }

        activityCount += 1
        updateActivityIndicatorStateForNetworkActivityChange()
    }

    public func decrementActivityCount() {
        lock.lock() ; defer { lock.unlock() }
        guard activityCount > 0 else { return }

        activityCount -= 1
        updateActivityIndicatorStateForNetworkActivityChange()
    }

    // MARK: - Private - Activity Indicator State

    private func updateActivityIndicatorStateForNetworkActivityChange() {
        guard enabled else { return }

        switch activityIndicatorState {
        case .NotActive:
            if activityCount > 0 { activityIndicatorState = .DelayingStart }
        case .DelayingStart:
            // No-op - let the delay timer finish
            break
        case .Active:
            if activityCount == 0 { activityIndicatorState = .DelayingCompletion }
        case .DelayingCompletion:
            if activityCount > 0 { activityIndicatorState = .Active }
        }
    }

    // MARK: - Private - Notification Registration

    private func registerForNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()

        notificationCenter.addObserver(
            self,
            selector: "networkRequestDidStart",
            name: Notifications.Task.DidResume,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: "networkRequestDidComplete",
            name: Notifications.Task.DidSuspend,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: "networkRequestDidComplete",
            name: Notifications.Task.DidComplete,
            object: nil
        )
    }

    func unregisterForNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // MARK: - Private - Notifications

    @objc private func networkRequestDidStart() {
        incrementActivityCount()
    }

    @objc private func networkRequestDidComplete() {
        decrementActivityCount()
    }

    // MARK: - Private - Timers

    private func scheduleStartDelayTimer() {
        startDelayTimer = NSTimer(
            timeInterval: startDelay,
            target: self,
            selector: "startDelayTimerFired",
            userInfo: nil,
            repeats: false
        )

        NSRunLoop.mainRunLoop().addTimer(startDelayTimer!, forMode: NSRunLoopCommonModes)
        NSRunLoop.mainRunLoop().addTimer(startDelayTimer!, forMode: UITrackingRunLoopMode)
    }

    private func scheduleCompletionDelayTimer() {
        completionDelayTimer = NSTimer(
            timeInterval: completionDelay,
            target: self,
            selector: "completionDelayTimerFired",
            userInfo: nil,
            repeats: false
        )

        NSRunLoop.mainRunLoop().addTimer(completionDelayTimer!, forMode: NSRunLoopCommonModes)
        NSRunLoop.mainRunLoop().addTimer(completionDelayTimer!, forMode: UITrackingRunLoopMode)
    }

    @objc private func startDelayTimerFired() {
        lock.lock() ; defer { lock.unlock() }

        if activityCount > 0 {
            activityIndicatorState = .Active
        } else {
            activityIndicatorState = .NotActive
        }
    }

    @objc private func completionDelayTimerFired() {
        lock.lock() ; defer { lock.unlock() }
        activityIndicatorState = .NotActive
    }

    private func invalidateStartDelayTimer() {
        startDelayTimer?.invalidate()
        startDelayTimer = nil
    }

    private func invalidateCompletionDelayTimer() {
        completionDelayTimer?.invalidate()
        completionDelayTimer = nil
    }
}
