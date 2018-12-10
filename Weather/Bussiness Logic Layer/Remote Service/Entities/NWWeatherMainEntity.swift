//
//  NWWeatherMainEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation
class NWWeatherMainEntity {

    var currentTemp: Double
    var maxTemp: Double
    var minTemp: Double
    var humidity: Double
    
    init?(json: [String: AnyObject]?) {
        guard let currentTemp_ = json?[Key.currentTemp] as? Double,
              let maxTemp_ = json?[Key.maxTemp] as? Double,
              let minTemp_ = json?[Key.minTemp] as? Double,
              let humidity_ = json?[Key.humidity] as? Double else { return nil }
   
        currentTemp = currentTemp_
        maxTemp = maxTemp_
        minTemp = minTemp_
        humidity = humidity_
    }
    
    struct Key {
        static let currentTemp = "temp"
        static let  maxTemp = "temp_max"
        static let  minTemp = "temp_min"
        static let  humidity = "humidity"
    }
}
