
//  WeatherProtocols.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/7/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.

protocol WeatherPresenterToInteractorProtocol : class {
    func obtainCities(completion: @escaping (Array<CityPlainEntity>) -> Void)
    func obtainCities(searchText: String, completion: @escaping (Array<CityPlainEntity>) -> Void)
    func updateCitiesFromRemote(completion: @escaping (Array<CityPlainEntity>) -> Void)
    func startTime()
    func stopTime()
}

protocol WeatherInteractorToPresenterProtocol : class {
    func didTriggerTimer()
}

protocol WeatherRouterProtocol : class {
}
