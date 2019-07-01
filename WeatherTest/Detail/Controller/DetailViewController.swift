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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        collectionView.register(UINib(nibName: WeatherInfoCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: WeatherInfoCollectionViewCell.identifier)
    }
    
    init(weatherDay: WeatherDay) {
        viewModel = DetailViewModel(weatherDay: weatherDay)
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        title = "Weather Detail"
        titleLabel.text = viewModel.titleLabel
    }
    

}
