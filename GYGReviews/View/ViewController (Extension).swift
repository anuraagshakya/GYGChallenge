//
//  File.swift
//  GYGReviews
//
//  Created by Anuraag Shakya on 06.07.18.
//  Copyright © 2018 Bhunte. All rights reserved.
//

import UIKit

// Code to allow hiding of keyboard when tapped around. Solution obtained from
//  https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
