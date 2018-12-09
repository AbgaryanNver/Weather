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
        currentTemp.text = entity.currentTemp
        minTemp.text = entity.minTemp
        maxTemp.text = entity.maxTemp
        humidity.text = entity.humidity
        weatherDescription.text = entity.weatherType
    }
}
