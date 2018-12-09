//
//  WeatherViewOutput.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/7/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

protocol WeatherViewOutput {
    func viewIsReady()
    func didTriggerViewWillAppear()
    func didTriggerViewWillDisappear()
    func didTriggerSearchEvent(_ searchString: String)
}
