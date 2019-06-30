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

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(with viewModel: WeatherDateViewModel) {
        self.label.text = DateFormatter.weatherTextFormatter.string(from: viewModel.date)
    }
}
