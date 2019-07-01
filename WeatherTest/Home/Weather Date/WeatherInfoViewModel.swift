//
//  WeatherInfoViewModel.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

struct WeatherInfoViewModel: Codable, Equatable {
    let date: Date
    let weatherDate: WeatherDate
}
