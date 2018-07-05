//
//  NewReviewViewModel.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation

class NewReviewViewModel {
    func submitNewReviewWith(title: String, message: String, rating: String) {
        // Do submission here
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        let date = formatter.string(from: Date())
        let dateUnformatted = ""
        let language = UserDefaults.standard.string(forKey: "language")!
        let foreignLanguage = language != "en"
        let reviewerCountry = UserDefaults.standard.string(forKey: "country")!
        let reviewerName = UserDefaults.standard.string(forKey: "userName")!
        let author = reviewerName + " - " + reviewerCountry
        let reviewer_id = UserDefaults.standard.integer(forKey: "userID")
        let traveler_type = UserDefaults.standard.string(forKey: "travelerType")!

        let review = Review(
            author: author, date: date, dateUnformatted: dateUnformatted, foreignLanguage: foreignLanguage, languageCode: language, message: message, rating: rating, reviewerCountry: reviewerCountry, reviewerName: reviewerName, review_id: reviewer_id, title: title, traveler_type: traveler_type)
        
        // use the data to send POST request
        
        print(review)
    }
}
