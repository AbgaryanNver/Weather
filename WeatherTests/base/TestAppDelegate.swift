//
//  TestAppDelegate.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/9/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit
import XCTest

@testable import Weather

class TestAppDelegate: UIResponder, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        print("Testing")
        XCTestObservationCenter.shared.addTestObserver(self)
        return true
    }

    var window: UIWindow?
}

extension TestAppDelegate : XCTestObservation {
    func testCaseWillStart(_ testCase: XCTestCase) {
    }

    func testCaseDidFinish(_ testCase: XCTestCase) {
    }
}
