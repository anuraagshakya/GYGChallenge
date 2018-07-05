//
//  Review.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation

// Struct to hold all required returned information of a review
struct Review {
    let author: String
    let date: String
    let dateUnformatted: String
    let foreignLanguage: Bool
    let languageCode: String
    let message: String
    let rating: String
    let reviewerCountry: String
    let reviewerName: String
    let review_id: Int
    let title: String
    let traveler_type: String
}
