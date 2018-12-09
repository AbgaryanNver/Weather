//
//  RemoteService.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

protocol RemoteServiceProtocol : class {
    
    func fetchCities(completion: @escaping (Array<CityPlainEntity>?, Error?) -> Void)
}
