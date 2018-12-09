//
//  WeatherRepositoryProtocol.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

protocol CititesRepositoryProtocol : class {
    
    func obtainCities(completion: @escaping (Array<CityPlainEntity>?) -> Void)
    func obtainCities(searchText: String, completion: @escaping (Array<CityPlainEntity>?) -> Void)
    func updateCitiesFromRemote(completion: @escaping (Array<CityPlainEntity>?) -> Void)
    
}

