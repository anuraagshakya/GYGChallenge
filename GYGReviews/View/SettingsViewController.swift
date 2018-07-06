//
//  SettingsViewController.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 06.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func reviewListSettingsApplied(withMaxNumber: Int, filter: Filter, sort: Sort)
}

class SettingsViewController: UIViewController {
    weak var delegate: SettingsViewControllerDelegate?
    
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var sortCriteriaSegment: UISegmentedControl!
    @IBOutlet weak var sortOrderSegment: UISegmentedControl!
    @IBOutlet weak var fliterRuleSegment: UISegmentedControl!
    @IBOutlet weak var filterValueSegment: UISegmentedControl!
    
    @IBAction func applySettingsPressed(_ sender: Any) {
        let maxString = numberText.text ?? ""
        let maxNumber = Int(maxString) ?? 0
        
        let filterRuleString = fliterRuleSegment.titleForSegment(at: fliterRuleSegment.selectedSegmentIndex)
        var filterRule: FilterRule
        switch filterRuleString {
        case "<":
            filterRule = .LesserThan
        case "<=":
            filterRule = .LesserThanEquals
        case "=":
            filterRule = .Equals
        case ">=":
            filterRule = .GreaterThanEquals
        default:
            filterRule = .GreaterThan
        }
        let filter = Filter(
            criteria: .Rating,
            rule: filterRule,
            value: String(describing: filterValueSegment.selectedSegmentIndex + 1))
        
        let sortCriteriaString = sortCriteriaSegment.titleForSegment(at: sortCriteriaSegment.selectedSegmentIndex)
        let sortOrderString = sortOrderSegment.titleForSegment(at: sortOrderSegment.selectedSegmentIndex)
        let sort = Sort(
            criteria: sortCriteriaString == "Rating" ? .Rating : .ReviewDate,
            order: sortOrderString == "Ascending" ? .Ascending : .Descending)
        
        self.delegate?.reviewListSettingsApplied(withMaxNumber: maxNumber, filter: filter, sort: sort)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Edit List Settings"
    }
}
