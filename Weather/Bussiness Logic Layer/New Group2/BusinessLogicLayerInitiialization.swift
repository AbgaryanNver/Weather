//
//  BusinessLogicLayerInitiialization.swift.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

class BusinessLogicLayerInitiialization {
    
    func createCitietsRepository() -> CitiesRepository {
        let citiesRepository = CitiesRepository()
        citiesRepository.networkService = createNetworkService()
        citiesRepository.databaseService = createDatabaseService()
        citiesRepository.databaseService.deleteAll()
        return citiesRepository
    }
    
    fileprivate func createNetworkService() -> RemoteService {
       
        let networkService = RemoteService()
        networkService.networkManager = RemoteManager()

        return networkService
    }

    fileprivate func createDatabaseService() -> LocalStorageService {
        let databaseService = LocalStorageService()
        return databaseService
    }

}

