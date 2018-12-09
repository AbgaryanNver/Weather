//
//  WeatherInteractor.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

class WeatherInteractor : WeatherPresenterToInteractorProtocol {
    
    var citiesRepository : CititesRepositoryProtocol!
    var presenter : WeatherInteractorToPresenterProtocol!
    var timeService : TimeServiceProtocol!
    
    func obtainCities(completion: @escaping (Array<CityPlainEntity>) -> Void) {
        citiesRepository.obtainCities { (cities) in
            if let cities = cities {
                completion(cities)
            }
        }
    }
    
    func obtainCities(searchText: String, completion: @escaping (Array<CityPlainEntity>) -> Void) {
        citiesRepository.obtainCities(searchText: searchText) { (cities) in
            if let cities = cities {
                completion(cities)
            }
        }
    }
    
    func updateCitiesFromRemote(completion: @escaping (Array<CityPlainEntity>) -> Void) {
        citiesRepository.updateCitiesFromRemote { (cities) in
            if let cities = cities, cities.count > 0 {
                completion(cities)
            }
        }
    }
    
    func startTime() {
        timeService.startTime(output: self)
    }
    
    func stopTime() {
        timeService.stopTime()
    }
}

extension WeatherInteractor : TimeServiceOutputProtocol {

    func didTriggerTimer() {
        presenter.didTriggerTimer()
    }
}
