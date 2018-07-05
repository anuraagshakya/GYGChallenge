//
//  Review.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation

struct Review {
    let languageCode: String
    let message: String
    let rating: Double
    let reviewerCountry: String
    let reviewerName: String
    let review_id: Int
    let title: String
    let traveler_type: String
    
    var author: String {
        get {
            return reviewerName + " - " + reviewerCountry
        }
    }
    
    var foreignLanguage: Bool {
        get {
            return languageCode != "en"
        }
    }
}
