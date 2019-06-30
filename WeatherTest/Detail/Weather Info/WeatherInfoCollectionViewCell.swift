//
//  WeatherInfoCollectionViewCell.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 01/07/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit

class WeatherInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: WeatherInfoCollectionViewCell.self)
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with viewModel: WeatherDateViewModel) {
        self.hourLabel.text = DateFormatter.hourFormatter.string(from: viewModel.date)
        self.temperatureLabel.text = "\(viewModel.weatherDate.temperature.twoMeters.kelvinToCelsius) Celsius degrees"
        self.pressionLabel.text = "\(viewModel.weatherDate.pression.seaLevel) pascal"
    }

}
