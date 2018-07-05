//
//  ViewController.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    var dataSource = ListViewDataSource()
    lazy var viewModel: ListViewModel = {
        let viewModel = ListViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Reviews"
        
        dataSource.onDataUpdated = { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self.dataSource
        
        viewModel.fetchReview(max: 20, withFilter: Filter(criteria: .Rating, rule: .Equals, value: "5.0"), sortedBy: Sort(criteria: .ReviewDate, order: .Descending))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

