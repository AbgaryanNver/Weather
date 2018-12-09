//
//  Config.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit

struct Config {
    
    struct TimerService {
        static var timerUpdateDuration : Float {
            get {
                return 30.0
            }
        }
    }
    
}

extension Config {
    struct URLCreator {
        static private let baseUrl = "http://api.openweathermap.org/data/2.5/"
        static private let kAPIUrlStringForCities = "box/city?bbox=43.79,39.00,45.46,41.16,10"
        static private let kAPIAPPID = "54d828d299c63bae24faeccf7dee7828"
        
        static var url : URL? {
            get {
                return URL(string: baseUrl + kAPIUrlStringForCities + "&APPID=\(kAPIAPPID)")
            }
        }
        
    }
}
