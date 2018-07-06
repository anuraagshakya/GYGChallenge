//
//  SettingsViewController.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 06.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    // Protocol to inform the delegate that the user has chosen to apply some
    //  settings and what they are
    func reviewListSettingsApplied(withMaxNumber: Int, filter: Filter, sort: Sort)
}

class SettingsViewController: UIViewController {
    weak var delegate: SettingsViewControllerDelegate?
    
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var sortCriteriaSegment: UISegmentedControl!
    @IBOutlet weak var sortOrderSegment: UISegmentedControl!
    @IBOutlet weak var fliterRuleSegment: UISegmentedControl!
    @IBOutlet weak var filterValueSegment: UISegmentedControl!
    @IBOutlet weak var filterSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit List Settings"
        
        // Add tap gesture recongnizer to close keyboard when tapped around
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func applySettingsPressed(_ sender: Any) {
        // When the apply button is pressed, the settings are read and passed
        //  to its delegate object.
        
        // Find the max number of review to display. If there was no input, the
        //  max is set to 20 which is default
        let maxString = numberText.text ?? ""
        let maxNumber = Int(maxString) ?? 20
        
        // Set the filter on rating criteria if the filter switch is toggled on
        var filter: Filter
        if (filterSwitch.isOn) {
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
            filter = Filter(
                criteria: .Rating,
                rule: filterRule,
                value: String(describing: filterValueSegment.selectedSegmentIndex + 1))
        } else {
            // Else filter is on (rating=0), i.e., no filter
            filter = Filter(criteria: .Rating, rule: .Equals, value: "0")
        }
        
        
        // Setup the sort based on increasing/decreasing rating/review date
        let sortCriteriaString = sortCriteriaSegment.titleForSegment(at: sortCriteriaSegment.selectedSegmentIndex)
        let sortOrderString = sortOrderSegment.titleForSegment(at: sortOrderSegment.selectedSegmentIndex)
        let sort = Sort(
            criteria: sortCriteriaString == "Rating" ? .Rating : .ReviewDate,
            order: sortOrderString == "Ascending" ? .Ascending : .Descending)
        
        // Inform the delegate of users choices
        self.delegate?.reviewListSettingsApplied(withMaxNumber: maxNumber, filter: filter, sort: sort)
        
        // Dissmiss self from navigation controller
        _ = navigationController?.popViewController(animated: true)
    }
}
