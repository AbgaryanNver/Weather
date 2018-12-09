//
//  LocalStorageServiceProtocol.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//


protocol LocalStorageServiceProtocol : class {
    
    func queryCities(completion: @escaping (Array<CityPlainEntity>?) -> Void)
    func queryCities(searchText: String, completion: @escaping (Array<CityPlainEntity>?) -> Void)
   
    func save(cities: Array<CityPlainEntity>)
    func deleteAll()
    
}
