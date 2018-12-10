//
//  WeatherViewControllerInitializer.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import UIKit

struct WeatherViewControllerInitializer {
    
    func createModule() -> UIViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController

        let weatherPresenter = WeatherPresentor()

        let weatherInteractor = WeatherInteractor()
        let timeService = TimeService(duration: Config.TimerService.timerUpdateDuration)
        
        let businessLayerInitiliazor = BusinessLogicLayerInitiialization()
        let citiesRepository = businessLayerInitiliazor.createCitietsRepository()
        
        view?.output = weatherPresenter
        weatherPresenter.interactor = weatherInteractor
        weatherPresenter.view = view
        weatherInteractor.presenter = weatherPresenter
        weatherInteractor.citiesRepository = citiesRepository
        weatherInteractor.timeService = timeService
        
        return view
    }
}

