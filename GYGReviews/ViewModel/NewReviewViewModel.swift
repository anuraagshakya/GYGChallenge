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
        // This function sets up the HTTP POST request and transmits it
        
        // Get user ID
        let reviewer_id = UserDefaults.standard.integer(forKey: "userID")
        
        // Get URLSession shared object
        let session = URLSession.shared
        
        // Create URL request from url string
        let url = URL(string: "https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/review")!
        var request = URLRequest(url: url)
        
        // Set POST parameters
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "id=\(reviewer_id)&title=\(title)&message=\(message)&rating=\(rating)"
        request.httpBody = postString.data(using: .utf8)
        
        // Create the data task for the shared session to carry out
        let task = session.dataTask(with: request) { data, response, error in
            // Guard for network errors
            guard error == nil else {
                print("Network error: \(error!.localizedDescription)")
                // TODO: Notify user of error
                return
            }
            
            // Guard for absence of data
            guard let data = data else {
                print("Network error: No data received")
                // TODO: Notify user of error
                return
            }
            
            // Check if response status is 200 (OK), else return
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                print("HTTP error: statusCode should be 200, but is \(httpStatus.statusCode)")
                // TODO: Notify user of error
                return
            }
            
            let responseString = String(data: data, encoding: .utf8) ?? ""
            print("responseString = \(responseString)")
        }
        
        // Do the task to send data to server
        task.resume()
    }
}
