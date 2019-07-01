//
//  WeatherDateTableViewCell.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit

class WeatherDateTableViewCell: UITableViewCell {
    static let identifier = String(describing: WeatherDateTableViewCell.self)

    @IBOutlet weak var daylabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with viewModel: WeatherDay) {
        self.daylabel.text = DateFormatter.weatherTextFormatter.string(from: viewModel.day)
        if let temperature = viewModel.weatherInfos.first?.weatherDate.temperature.twoMeters.kelvinToCelsius {
            self.temperatureLabel.text = "\(temperature)°C"
        }
    }
}
