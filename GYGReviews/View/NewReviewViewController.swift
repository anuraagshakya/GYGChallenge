//
//  NewReviewViewController.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

class NewReviewViewController: UIViewController {

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var ratingSegment: UISegmentedControl!
    
    lazy var viewModel: NewReviewViewModel = NewReviewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        let title = titleLabel.text ?? ""
        let message = messageText.text ?? ""
        let rating = ratingSegment.titleForSegment(at: ratingSegment.selectedSegmentIndex)!
        viewModel.submitNewReviewWith(title: title, message: message, rating: rating)
        
        _ = navigationController?.popViewController(animated: true)
    }
}
