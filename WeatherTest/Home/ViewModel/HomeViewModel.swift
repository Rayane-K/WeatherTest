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

typealias WeatherDay = (day: Date, weatherInfos: [WeatherInfoViewModel])
struct ResponseViewModel {
    let week: [WeatherDay]
    
    var dayTitle: String? {
        guard let day = week.first?.day else { return nil }
        return DateFormatter.weatherTextFormatter.string(from: day)
    }
}

class HomeViewModel {
    var response: ResponseViewModel = ResponseViewModel(week: [])
    
    var stateDidChange: ((State) -> Void)?
    
    let api = WeatherAPI()
    
    func fetch() {
        api.fetchWeatherFromApi(completion: { response in
            self.response = self.getResponseViewModel(from: self.getWeatherInfos(from: response))
            self.stateDidChange?(.success)
//            self.persistData()
        }, error: { error in
            self.stateDidChange?(.error(error))
        })
    }
    
    
    private func getResponseViewModel(from weatherInfos: [WeatherInfoViewModel]) -> ResponseViewModel {
        let days = Set(weatherInfos.map { DateFormatter.weatherTextFormatter.string(from: $0.date) })
        
        let week = days.compactMap { day -> WeatherDay? in
            guard let date = DateFormatter.weatherTextFormatter.date(from: day) else { return nil }
            let infos = weatherInfos.filter { DateFormatter.weatherTextFormatter.string(from: $0.date) == day }
            return WeatherDay(day: date, weatherInfos: infos)
        }
        
        return ResponseViewModel(week: week)
    }
    
    
    private func getWeatherInfos(from dictionary: [String: WeatherDate]) -> [WeatherInfoViewModel] {
        return dictionary.compactMap { weatherRow -> WeatherInfoViewModel? in
            guard let date = DateFormatter.weatherFormatter.date(from: weatherRow.key) else { return nil }
            return WeatherInfoViewModel(date: date, weatherDate: weatherRow.value)
        }
    }
    
//    private func persistData() {
//        let model = WeatherModel(days: ["test"])
//        WeatherStoreManager.saveData(model: model)
//    }
}
