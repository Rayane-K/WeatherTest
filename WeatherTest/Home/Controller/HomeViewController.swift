//
//  ViewController.swift
//  WeatherTest
//
//  Created by Kurrimboccus Rayane on 30/06/2019.
//  Copyright © 2019 Kurrimboccus Rayane. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModel
    
    
    init() {
        viewModel = HomeViewModel()
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.stateDidChange = stateDidChange
        viewModel.fetch()
        
        tableView.register(UINib(nibName: WeatherDateTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WeatherDateTableViewCell.identifier)
    }
    
    private func stateDidChange(_ state: State) {
        tableView.reloadData()
    }

}
