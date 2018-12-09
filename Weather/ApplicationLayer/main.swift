//
//  main.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/9/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation
import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil
let appDelegateClass = isRunningTests ? "WeatherTests.TestAppDelegate" : NSStringFromClass(AppDelegate.self)
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, appDelegateClass)
