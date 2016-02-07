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
        case NotActive, DelayingStart, Active, DelayingEnd
    }

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

    public private(set) var isNetworkActivityIndicatorVisible: Bool = false

    public var activationDelay: NSTimeInterval = 1.0
    public var completionDelay: NSTimeInterval = 0.17

    private var activityIndicatorState: ActivityIndicatorState = .NotActive
    private var activityCount: Int = 0
    private var enabled: Bool = false

    private var activationDelayTimer: NSTimer?
    private var completionDelayTimer: NSTimer?

    private let lock = NSLock()

    // MARK: - Internal - Initialization

    init() {
        registerForNotifications()
    }

    deinit {
        unregisterForNotifications()

        invalidateActivationDelayTimer()
        invalidateCompletionDelayTimer()
    }

    // MARK: - Activity Count

    public func incrementActivityCount() {
        lock.lock() ; defer { lock.unlock() }
        activityCount += 1
    }

    public func decrementActivityCount() {
        lock.lock() ; defer { lock.unlock() }

        if activityCount > 0 { activityCount -= 1 }
    }

    // MARK: - Internal - Activity Indicator State

    func updateActivityIndicatorStateForNetworkActivityChange() {
        guard enabled else { return }

        switch activityIndicatorState {
        case .NotActive:
            if activityCount > 0 {
                activityIndicatorState = .DelayingStart

            }
        case .DelayingStart:
            print("")
        case .Active:
            print("")
        case .DelayingEnd:
            print("")
        }
    }

    func setNetworkActivityIndicatorVisible(visible: Bool) {
        dispatch_async(dispatch_get_main_queue()) {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = visible
        }
    }

    // MARK: - Internal - Notification Registration

    func registerForNotifications() {
        let notificationCenter = NSNotificationCenter.defaultCenter()

        notificationCenter.addObserver(
            self,
            selector: "networkRequestDidStart",
            name: NotificationNames.TaskDidResume,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: "networkRequestDidFinish",
            name: NotificationNames.TaskDidSuspend,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: "networkRequestDidFinish",
            name: NotificationNames.TaskDidCancel,
            object: nil
        )
    }

    func unregisterForNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    // MARK: - Internal - Notifications

    func networkRequestDidStart() {
        incrementActivityCount()
    }

    func networkRequestDidFinish() {
        decrementActivityCount()
    }

    // MARK: - Internal - Timers

    func startActivationDelayTimer() {
        activationDelayTimer = NSTimer(
            timeInterval: activationDelay,
            target: self,
            selector: "activationDelayTimerFired",
            userInfo: nil,
            repeats: false
        )

        NSRunLoop.mainRunLoop().addTimer(activationDelayTimer!, forMode: NSRunLoopCommonModes)
        NSRunLoop.mainRunLoop().addTimer(activationDelayTimer!, forMode: UITrackingRunLoopMode)
    }

    func startCompletionDelayTimer() {
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

    func activationDelayTimerFired() {
        lock.lock() ; defer { lock.unlock() }
        print("activationDelayTimerFired")
    }

    func invalidateActivationDelayTimer() {
        activationDelayTimer?.invalidate()
        activationDelayTimer = nil
    }

    func invalidateCompletionDelayTimer() {
        completionDelayTimer?.invalidate()
        completionDelayTimer = nil
    }
}
