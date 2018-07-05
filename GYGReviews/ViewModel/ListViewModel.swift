//
//  ListViewModel.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListViewModel {
    var dataSource: ListViewDataSource
    
    init(dataSource: ListViewDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchReview(max: Int = 20, withFilter: Filter? = nil, sortedBy: Sort = Sort(criteria: .ReviewDate, order: .Descending)) {
        var urlString = ""
        let urlBaseString = "https://www.getyourguide.com/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json?"
        
        urlString += urlBaseString + "count=" + String(describing: max) + "&"
        
        if let filter = withFilter {
            if let filterString = filter.filterString() {
                urlString += filterString + "&"
            } else {
                print("Invalid Filter, skipping")
            }
        }
        if let sortString = sortedBy.sortString() {
            urlString += sortString
        } else {
            print("Invalid Sort, skipping")
        }
        
        if let url = URL(string: urlString) {
            DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
                if let data = try? String(contentsOf: url) {
                    let json = JSON(parseJSON: data)
                    
                    if json["status"].boolValue == true {
                        self.parse(json: json)
                        return
                    }
                } else {
                    print("Could not read contents of URL")
                }
            }
        }
    }
    
    private func parse(json: JSON) {
        var data = [Review]()
        for dataPoint in json["data"].arrayValue {
            let author = dataPoint["author"].stringValue
            let date = dataPoint["date"].stringValue
            let foreignLanguage = dataPoint["foreignLanguage"].boolValue
            let languageCode = dataPoint["languageCode"].stringValue
            let message = dataPoint["message"].stringValue
            let rating = dataPoint["rating"].stringValue
            let reviewerCountry = dataPoint["reviewerCountry"].stringValue
            let reviewerName = dataPoint["reviewerName"].stringValue
            let review_id = dataPoint["review_id"].intValue
            let title =  dataPoint["title"].stringValue
            let traveler_type = dataPoint["traverler_type"].stringValue
            let review = Review(author: author, date: date, dateUnformatted: "", foreignLanguage: foreignLanguage, languageCode: languageCode, message: message, rating: rating, reviewerCountry: reviewerCountry, reviewerName: reviewerName, review_id: review_id, title: title, traveler_type: traveler_type)
            data.append(review)
        }
        self.dataSource.data = data
    }
}
