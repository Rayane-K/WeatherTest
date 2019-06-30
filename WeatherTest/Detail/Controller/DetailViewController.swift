//
//  DetailViewController.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let viewModel: DetailViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        title = "Weather Detail"
    }
    

}
