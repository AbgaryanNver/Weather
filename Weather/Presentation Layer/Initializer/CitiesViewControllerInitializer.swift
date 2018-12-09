//
//  CitiesViewControllerInitializer.swift
//  Weather_Viper
//
//  Created by Hayk Mnatsakanyan on 11/27/18.
//  Copyright © 2018 Hayk Mnatsakanyan. All rights reserved.
//

import UIKit

struct WeatherViewControllerInitializer {
    
    func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController

        let weatherPresenter = WeatherPresentor()

        let weatherInteractor = WeatherInteractor()
        let timeService = TimeService(duration: Config.TimerService.timerUpdateDuration)
        
        let businessLayerInitiliazor = BusinessLogicLayerInitiialization()
        let citiesRepository = businessLayerInitiliazor.createCitietsRepository()
        
        view.output = weatherPresenter
        weatherPresenter.interactor = weatherInteractor
        weatherPresenter.view = view
        weatherPresenter.router = nil
        weatherInteractor.presenter = weatherPresenter
        weatherInteractor.citiesRepository = citiesRepository
        weatherInteractor.timeService = timeService
        
        return view
    }
}

