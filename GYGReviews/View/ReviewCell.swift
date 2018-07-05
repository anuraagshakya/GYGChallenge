//
//  ReviewCell.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    
    var review: Review? {
        didSet {
            guard let review = review else {
                return
            }
            
            if let ratingDouble = Double(review.rating) {
                var stars = ""
                for _ in 1...Int(ratingDouble) {
                    stars += "⭐️"
                }
                rating?.text = stars
            } else {
                rating?.text = "No rating"
            }
            date?.text = review.date
            message?.text = review.message
            title?.text = review.title
            author?.text = review.author
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
