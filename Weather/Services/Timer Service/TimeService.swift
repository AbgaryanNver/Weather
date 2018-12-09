//
//  TimeService.swift
//  Weather
//
//  Created by Nver Abgaryan on 12/8/18.
//  Copyright © 2018 Nver Abgaryan. All rights reserved.
//

import Foundation

protocol TimeServiceProtocol {
    init(duration: Float)
    func startTime(output: TimeServiceOutputProtocol)
    func stopTime()
}

public protocol TimeServiceOutputProtocol {
    func didTriggerTimer()
}

class TimeService : TimeServiceProtocol {

    var timer : Timer?
    var duration : Float = 0.0
    
    required init(duration: Float) {
        self.duration = duration
    }
    
    func startTime(output: TimeServiceOutputProtocol) {
        stopTime()
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(duration), repeats: true) { (timer) in
            output.didTriggerTimer()
        }
    }
    
    func stopTime() {
        timer?.invalidate()
    }
}
