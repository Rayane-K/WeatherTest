//
//  DetailViewModel.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

struct DetailViewModel {
    let weatherDay: WeatherDay
    
    init(weatherDay: WeatherDay) {
        self.weatherDay = weatherDay
    }
}
