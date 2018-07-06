//
//  FilterParameters.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 05.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import Foundation

// Sort
enum SortOrder {
    case Descending, Ascending
}

enum SortCriteria {
    case ReviewDate, Rating
}

struct Sort {
    let criteria: SortCriteria
    let order: SortOrder
    
    func sortString() -> String? {
        var output = "sortBy="
        
        switch criteria {
        case .Rating:
            output += "rating"
        case .ReviewDate:
            output += "date_of_review"
        }
        
        output += "&direction="
        switch order {
        case .Ascending:
            output += "ASC"
        case .Descending:
            output += "DESC"
        }
        
        return output
    }
}

// Filter
enum FilterCriteria {
    case Rating, ReviewDate
}
enum FilterRule {
    case LesserThan, LesserThanEquals, Equals, GreaterThanEquals, GreaterThan
}
struct Filter {
    let criteria: FilterCriteria
    let rule: FilterRule
    let value: String
    
    func filterString() -> String? {
        var output = ""
        
        switch criteria {
        case .Rating:
            output += "rating"
        case .ReviewDate:
            output += "date_of_review"
        }
        
        switch rule {
        case .Equals:
            output += "="
        case .GreaterThan:
            output += ">"
        case .LesserThan:
            output += "<"
        case .GreaterThanEquals:
            output += ">="
        case .LesserThanEquals:
            output += "<="
        }
        
        return output + value
    }
}
