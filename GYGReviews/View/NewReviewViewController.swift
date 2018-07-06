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
    
    var viewModel: NewReviewViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Instantiate the view model
        viewModel = NewReviewViewModel()
        
        // Add tap gesture recongnizer to close keyboard when tapped around
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        // When the user presses the Submit button, we read the title, message
        //  and rating inputs and pass then to the view model to handle
        let title = titleLabel.text ?? ""
        let message = messageText.text ?? ""
        let rating = ratingSegment.titleForSegment(at: ratingSegment.selectedSegmentIndex)!
        viewModel.submitNewReviewWith(title: title, message: message, rating: rating)
        
        // Pop and dismiss self from the navigation controller
        _ = navigationController?.popViewController(animated: true)
    }
}
