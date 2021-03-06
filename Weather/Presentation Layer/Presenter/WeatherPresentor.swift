//
//  WeatherPresentor.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

class WeatherPresentor : WeatherViewOutput {
   
    weak var view : WeatherViewInput?
    var interactor : WeatherPresenterToInteractorProtocol?
    var router : WeatherRouterProtocol?
    
    func viewIsReady() {
        view?.setupInitialState()
        view?.showProgressBar(show: true)
        interactor?.obtainCities { [unowned self] (plainCities) in
            let cities = self.convertCitiesForView(plainCities: plainCities)
            if cities.count > 0 {
                self.view?.showProgressBar(show: false)
                self.view?.updateTable(cities)
            }
        }
    }
    
    func didTriggerSearchEvent(_ searchString: String) {
        interactor?.obtainCities(searchText: searchString) {  [unowned self] (plainCities) in
            let cities = self.convertCitiesForView(plainCities: plainCities)
            self.view?.updateTable(cities)
        }
    }
    
    func didTriggerViewWillAppear() {
        self.interactor?.startTime()
    }
    
    func didTriggerViewWillDisappear() {
        self.interactor?.stopTime()
    }
    
    private func convertCitiesForView(plainCities: Array<CityPlainEntity>) -> Array<CityEntity> {
        var cities = Array<CityEntity>()
        for plainCity in plainCities {
            let cityEntity = CityEntity(id: plainCity.id,
                                        name: plainCity.name,
                                        currentTemp: "current temp. = \(plainCity.currentTemp) C",
                                        minTemp: "min temp. = \(plainCity.minTemp) C",
                                        maxTemp: "max temp. = \(plainCity.maxTemp) C",
                                        humidity: "humidity = \(plainCity.humidity)",
                                        weatherDescription: plainCity.weatherDescription)
            cities.append(cityEntity)
        }
        return cities
    }
    
}

extension WeatherPresentor: WeatherInteractorToPresenterProtocol {
    
    func didTriggerTimer() {
        interactor?.updateCitiesFromRemote { (cities) in
            let cities = self.convertCitiesForView(plainCities: cities)
            self.view?.updateTable(cities)
        }
    }
}
