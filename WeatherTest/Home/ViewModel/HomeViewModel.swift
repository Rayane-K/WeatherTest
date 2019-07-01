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
    
    func fetch() {
        api.fetchWeatherFromApi(completion: { response in
            self.response = self.getResponseViewModel(from: self.getWeatherInfos(from: response))
            self.stateDidChange?(.success)
//            self.persistData()
        }, error: { error in
            self.stateDidChange?(.error(error))
        })
    }
    
    
    func getResponseViewModel(from weatherInfos: [WeatherInfoViewModel]) -> ResponseViewModel {
        let days = Set(weatherInfos.map { DateFormatter.weatherTextFormatter.string(from: $0.date) }).sorted()
        
        let week = days.compactMap { day -> WeatherDay? in
            guard let date = DateFormatter.weatherTextFormatter.date(from: day) else { return nil }
            let infos = weatherInfos.filter { DateFormatter.weatherTextFormatter.string(from: $0.date) == day }
            return WeatherDay(day: date, weatherInfos: infos)
        }.sorted { $0.day < $1.day }
        
        return ResponseViewModel(week: week)
    }
    
    
    func getWeatherInfos(from dictionary: [String: WeatherDate]) -> [WeatherInfoViewModel] {
        return dictionary.compactMap { weatherRow -> WeatherInfoViewModel? in
            guard let date = DateFormatter.weatherFormatter.date(from: weatherRow.key) else { return nil }
            return WeatherInfoViewModel(date: date, weatherDate: weatherRow.value)
            }.sorted { $0.date < $1.date }
    }
    
//    private func persistData() {
//        let model = WeatherModel(days: ["test"])
//        WeatherStoreManager.saveData(model: model)
//    }
}
