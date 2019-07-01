//
//  HomeViewModelTests.swift
//  WeatherTestTests
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import XCTest
import SwiftDate
@testable import WeatherTest

class HomeViewModelTests: XCTestCase {
    
    private let fixture = WeatherDateFixture()
    
    func testGetResponseViewModel() {
        // Given
        let firstDay = Date()
        let secondDay = Date() + 1.days
        let thirdDay = Date() + 2.days
        let weatherInfosViewModels = [
            WeatherInfoViewModel(date: firstDay, weatherDate: fixture.anyWeatherDate()),
            WeatherInfoViewModel(date: firstDay, weatherDate: fixture.anyWeatherDate()),
            WeatherInfoViewModel(date: secondDay, weatherDate: fixture.anyWeatherDate()),
            WeatherInfoViewModel(date: secondDay, weatherDate: fixture.anyWeatherDate()),
            WeatherInfoViewModel(date: thirdDay, weatherDate: fixture.anyWeatherDate()),
            WeatherInfoViewModel(date: thirdDay, weatherDate: fixture.anyWeatherDate())
        ]
        let homeViewModel = HomeViewModel()
        
        // When
        let result = homeViewModel.getResponseViewModel(from: weatherInfosViewModels)
        
        // Then
        XCTAssertEqual(result.week.count, 3) // 3 different days
    }
    
    func testGetWeatherInfos() {
        // Given
        let firstDate = DateFormatter.weatherFormatter.string(from: Date())
        let secondDate = DateFormatter.weatherFormatter.string(from: Date() + 2.hours)
        let weatherDate = fixture.anyWeatherDate(temperature: Temperature(twoMeters: 20, ground: 20),
                                                rain: 56,
                                                humidity: Humidity(twoMeters: 65),
                                                pression: Pression(seaLevel: 99),
                                                snowRisk: true)
        let response = [
            firstDate : weatherDate,
            secondDate: fixture.anyWeatherDate()
        ]
        let expectedViewModels = [
            WeatherInfoViewModel(date: DateFormatter.weatherFormatter.date(from: firstDate)!, weatherDate: weatherDate),
            WeatherInfoViewModel(date: DateFormatter.weatherFormatter.date(from: secondDate)!, weatherDate: fixture.anyWeatherDate())
        ]
        let homeViewModel = HomeViewModel()
        
        // When
        let result = homeViewModel.getWeatherInfos(from: response)
        
        // Then
        XCTAssertEqual(result, expectedViewModels)
    }
    
}
