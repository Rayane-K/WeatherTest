//
//  Doubletests.swift
//  WeatherTestTests
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import XCTest
@testable import WeatherTest

class Doubletests: XCTestCase {
    
    func testKelvinToCelsius() {
        // Given
        let temperatureInKelvin: Double = 289
        let expectedResult = 15.9
        
        // When
        let result = temperatureInKelvin.kelvinToCelsius
        
        // Then
        XCTAssertEqual(expectedResult, result)
    }
    
    func testKelvinToCelsius_zero() {
        // Given
        let temperatureInKelvin: Double = 0
        let expectedResult = -273.2
        
        // When
        let result = temperatureInKelvin.kelvinToCelsius
        
        // Then
        XCTAssertEqual(expectedResult, result)
    }

}
