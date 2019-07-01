//
//  HomeViewModel.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import Foundation
import CoreLocation

enum State {
    case success
    case loading
    case error(Error)
}

typealias WeatherDay = (day: Date, weatherInfos: [WeatherInfoViewModel])

struct ResponseViewModel {
    let week: [WeatherDay]
}

class HomeViewModel {
    var response: ResponseViewModel = ResponseViewModel(week: [])
    
    var stateDidChange: ((State) -> Void)?
    
    var api = WeatherAPI()
    
    var location: CLLocationCoordinate2D? {
        didSet {
            api.latitude = location?.latitude
            api.longitude = location?.longitude
        }
    }
    
    /*
     Fetch new weather informations from API
     */
    func fetch() {
        // print(WeatherStoreManager.loadItems()) // Not enough time to solve this problem : loading data from disk is not working
        api.fetchWeatherFromApi(completion: { response in
            let weatherInfoViewModels = self.getWeatherInfos(from: response)
            self.response = self.getResponseViewModel(from: weatherInfoViewModels)
            self.stateDidChange?(.success)
            self.persistData(weatherInfoViewModels)
        }, error: { error in
            self.stateDidChange?(.error(error))
        })
    }
    
    
    /*
     Returns a list of days with multiple hours weather info for each day, sorted
     */
    func getResponseViewModel(from weatherInfos: [WeatherInfoViewModel]) -> ResponseViewModel {
        let days = Set(weatherInfos.map { DateFormatter.weatherTextFormatter.string(from: $0.date) }).sorted()
        
        let week = days.compactMap { day -> WeatherDay? in
            guard let date = DateFormatter.weatherTextFormatter.date(from: day) else { return nil }
            let infos = weatherInfos.filter { DateFormatter.weatherTextFormatter.string(from: $0.date) == day }
            return WeatherDay(day: date, weatherInfos: infos)
        }.sorted { $0.day < $1.day }
        
        return ResponseViewModel(week: week)
    }
    
    /*
     Returns a list of weather information from the response list
     */
    func getWeatherInfos(from dictionary: [String: WeatherDate]) -> [WeatherInfoViewModel] {
        return dictionary.compactMap { weatherRow -> WeatherInfoViewModel? in
            guard let date = DateFormatter.weatherFormatter.date(from: weatherRow.key) else { return nil }
            return WeatherInfoViewModel(date: date, weatherDate: weatherRow.value)
            }.sorted { $0.date < $1.date }
    }
    
    /*
     Save weather info lcoally to be able to access it offline
     */
    private func persistData(_ weatherInfoViewModels: [WeatherInfoViewModel]) {
        WeatherStoreManager.saveData(viewModels: weatherInfoViewModels)
    }
}
