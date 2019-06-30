//
//  HomeViewModel.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation

enum State {
    case success
    case loading
    case error(Error)
}

class HomeViewModel {
    var dates: [WeatherDateViewModel] = []
    
    var stateDidChange: ((State) -> Void)?
    
    let api = WeatherAPI()
    
    func fetch() {
        api.fetchWeatherFromApi(completion: { response in
            self.dates = self.getWeatherDates(from: response)
            self.stateDidChange?(.success)
        }, error: { error in
            self.stateDidChange?(.error(error))
        })
    }
    
    
    private func getWeatherDates(from dictionary: [String: WeatherDate]) -> [WeatherDateViewModel] {
        return dictionary.compactMap { weatherRow -> WeatherDateViewModel? in
            guard let date = DateFormatter.weatherFormatter.date(from: weatherRow.key) else { return nil }
            return WeatherDateViewModel(date: date, weatherDate: weatherRow.value)
        }
    }
}
