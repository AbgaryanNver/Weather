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
        return weatherInfo?.currentTemp ?? 0.0
    }
    
    var minTemp : Double {
        return weatherInfo?.minTemp ?? 0.0
    }
    
    var maxTemp : Double {
        return weatherInfo?.maxTemp ?? 0.0
    }
    
    var humidity : Double {
        return weatherInfo?.humidity ?? 0.0
    }
    
    var weatherDescription : String {
        return weatherDescriptionObj?.description ?? ""
    }
    
    fileprivate var weatherInfo: NWWeatherMainEntity?
    fileprivate var weatherDescriptionObj: NWWeatherDiscripionEntity?
    
    init(json: [String: AnyObject]) {
        print(json)
        let id_ = json[Key.id] as? Int
        let name_ = json[Key.name] as? String
        let weatherInfo_ = json[Key.weatherInfo] as? [String: AnyObject]
        let weatherDescriptionObj_ = json[Key.description] as? Array<[String: AnyObject]>
       
        id = id_ ?? 0
        name = name_ ?? ""
        weatherInfo = NWWeatherMainEntity(json: weatherInfo_)
        weatherDescriptionObj = NWWeatherDiscripionEntity(json: weatherDescriptionObj_?.first)
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
    
    struct Key {
        static let id = "id"
        static let name = "name"
        static let weatherInfo = "main"
        static let description = "weather"
    }
}
