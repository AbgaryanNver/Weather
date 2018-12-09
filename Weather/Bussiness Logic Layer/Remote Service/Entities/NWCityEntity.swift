//
//  NWCityEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

class NWCityEntity {
    
    var id : Int = 0
    var name : String = ""
    var weatherInfo: NWWeatherMainEntity!
    var weatherType: NWWeatherDiscripionEntity!

    var plainObject : CityPlainEntity {
        return CityPlainEntity(id: id,
                               name: name,
                               currentTemp: weatherInfo.currentTemp,
                               minTemp: weatherInfo.minTemp,
                               maxTemp: weatherInfo.maxTemp,
                               humidity: weatherInfo.humidity,
                               weatherType: weatherType.description)
    }
    
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
}
