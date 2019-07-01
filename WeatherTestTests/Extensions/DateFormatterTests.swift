//
//  DateFormatterTests.swift
//  WeatherTestTests
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import XCTest
import SwiftDate
@testable import WeatherTest

class DateFormatterTests: XCTestCase {
    
    func testWeatherFormatter() {
        // Given
        let date = DateFormatter.weatherFormatter.date(from: "2019-02-02 10:00:00")!
        let expectedString = "2019-02-02 10:00:00"
        
        // When
        let result = DateFormatter.weatherFormatter.string(from: date)
        
        // Then
        XCTAssertEqual(result, expectedString)
    }
    
    func testWeatherTextFormatter() {
        // Given
        let date = DateFormatter.weatherTextFormatter.date(from: "Monday, JUL 8, 2019")!
        let expectedString = "Monday, JUL 8, 2019"
        
        // When
        let result = DateFormatter.weatherTextFormatter.string(from: date)
        
        // Then
        XCTAssertEqual(result, expectedString)
    }
    
    func testHourFormatter() {
        // Given
        let date = DateFormatter.hourFormatter.date(from: "10:56")!
        let expectedString = "10:56"
        
        // When
        let result = DateFormatter.weatherFormatter.string(from: date)
        
        // Then
        XCTAssertEqual(result, expectedString)
    }

}
