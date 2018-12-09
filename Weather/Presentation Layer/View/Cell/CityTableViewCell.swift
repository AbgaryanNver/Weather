//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/7/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet var cityName: UILabel!
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var minTemp: UILabel!
    @IBOutlet var maxTemp: UILabel!
    @IBOutlet var humidity: UILabel!
    @IBOutlet var weatherDescription: UILabel!
    
    var id  = 0
    
    func configureCell(_ entity: CityEntity) {
        id = entity.id
        cityName.text = entity.name
        currentTemp.text = "current temp. = \(entity.currentTemp) C"
        minTemp.text = "min temp. = \(entity.minTemp) C"
        maxTemp.text = "max temp. = \(entity.maxTemp) C"
        humidity.text = "humidity = \(entity.humidity)"
        weatherDescription.text = entity.weatherType
    }
}
