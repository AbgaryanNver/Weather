//
//  WeatherViewInput.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/7/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

protocol WeatherViewInput: class {

    func setupInitialState()
    
    func updateTable(_ infos: Array<CityEntity>)
}
