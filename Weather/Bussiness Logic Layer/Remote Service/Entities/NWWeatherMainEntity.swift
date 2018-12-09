//
//  NWWeatherMainEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation
class NWWeatherMainEntity {

    var currentTemp: Double = 0.0
    var maxTemp:Double = 0
    var minTemp:Double = 0
    var humidity:Double = 0
    
    init(json: [String: AnyObject]?) {
        enum Key : String {
            case currentTemp = "temp" //"main"
            case maxTemp = "temp_max"
            case minTemp = "temp_min"
            case humidity = "humidity"
        }
        
        let currentTemp_ = json?[Key.currentTemp.rawValue] as? Double
        let maxTemp_ = json?[Key.maxTemp.rawValue] as? Double
        let minTemp_ = json?[Key.minTemp.rawValue] as? Double
        let humidity_ = json?[Key.humidity.rawValue] as? Double
        
        currentTemp = currentTemp_ ?? 0.0
        maxTemp = maxTemp_ ?? 0.0
        minTemp = minTemp_ ?? 0.0
        humidity = humidity_ ?? 0.0
    }
}
