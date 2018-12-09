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
        enum Key : String {
            case currentTemp = "temp" 
            case maxTemp = "temp_max"
            case minTemp = "temp_min"
            case humidity = "humidity"
        }
        guard let currentTemp_ = json?[Key.currentTemp.rawValue] as? Double,
              let maxTemp_ = json?[Key.maxTemp.rawValue] as? Double,
              let minTemp_ = json?[Key.minTemp.rawValue] as? Double,
              let humidity_ = json?[Key.humidity.rawValue] as? Double else { return nil }
   
        currentTemp = currentTemp_
        maxTemp = maxTemp_
        minTemp = minTemp_
        humidity = humidity_
    }
}
