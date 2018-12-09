//
//  NWCityEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

class NWCityEntity {
    
    var id : Int
    var name : String
    
    var currentTemp : Double {
        get {
            return weatherInfo?.currentTemp ?? 0.0
        }
        set(s) {
            weatherInfo?.currentTemp = s
        }
    }
    
    var minTemp : Double {
        get {
            return weatherInfo?.minTemp ?? 0.0
        }
        set(s) {
            weatherInfo?.minTemp = s
        }
    }
    
    
    var maxTemp : Double {
        get {
            return weatherInfo?.maxTemp ?? 0.0
        }
        set(s){
            weatherInfo?.maxTemp = s
        }
    }
    
    var humidity : Double {
        get {
            return weatherInfo?.humidity ?? 0.0
        }
        set(s) {
            weatherInfo?.humidity = s
        }
    }
    
    var weatherDescription : String {
        get {
            return weatherType?.description ?? ""
        }
        set(s) {
            weatherType?.description = s
        }
    }
    
    var weatherInfo: NWWeatherMainEntity?
    var weatherType: NWWeatherDiscripionEntity?
    
    init(json: [String: AnyObject]) {
        print(json)
        enum Key : String {
            case id = "id"
            case name = "name"
            case weatherInfo = "main"
            case description = "weather"
        }
        
        let id_ = json[Key.id.rawValue] as? Int
        let name_ = json[Key.name.rawValue] as? String
        let weatherInfo_ = json[Key.weatherInfo.rawValue] as? [String: AnyObject]
        let weatherType_ = json["weather"] as? Array<[String: AnyObject]>
        id = id_ ?? 0
        name = name_ ?? ""
        weatherInfo = NWWeatherMainEntity(json: weatherInfo_)
        weatherType = NWWeatherDiscripionEntity(json: weatherType_?.first)
    }
    
    var plainObject : CityPlainEntity {
        return CityPlainEntity(id: id,
                               name: name,
                               currentTemp: currentTemp,
                               minTemp: minTemp,
                               maxTemp: maxTemp,
                               humidity: humidity,
                               weatherDescription: weatherDescription)
    }
}
