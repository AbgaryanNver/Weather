//
//  LSCityEntity.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import RealmSwift

class LSCityEntity : Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var currentTemp = 0.0
    @objc dynamic var minTemp = 0.0
    @objc dynamic var maxTemp = 0.0
    @objc dynamic var humidity = 0.0
    @objc dynamic var weatherDescription = ""

    override static func primaryKey() -> String? {
        return "id"
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

