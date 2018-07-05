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
    var viewModel: ListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the title of the view
        self.title = "Reviews"
        
        // Instantiate the view model with a pointer to the data source.
        viewModel = ListViewModel(dataSource: dataSource)
        
        // ListViewDataSource calls onDataUpdated when its data array is set. We
        //  use this closure to update our tableView in the event that data is
        //  changed, binding our view to it.
        dataSource.onDataUpdated = { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.dataSource = self.dataSource
        
        // Add button to the right corner of the navigation bar. This bar will
        //  be of BarButtonSystemItem.add type which will be displayes as a "+".
        //  When pressed, it calls `addReviewPressed` method
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addReviewPressed))
        
        // Finally, we call the `fetchReviews` method of our view model. This
        //  will update the data array in our data source.
        viewModel.fetchReviews(max: 20, withFilter: Filter(criteria: .Rating, rule: .Equals, value: "5.0"), sortedBy: Sort(criteria: .ReviewDate, order: .Descending))
    }
    
    @objc func addReviewPressed() {
        // This method instantiates, configures and pushes onto the navagation
        //  controller a view controller designed to input a new review. Check
        //  NewReviewViewController and NewReviewViewModel for more details.
        let view = storyboard?.instantiateViewController(withIdentifier: "newReview") as! NewReviewViewController
        view.title = "Submit a Review"
        navigationController?.pushViewController(view, animated: true)
    }
}

