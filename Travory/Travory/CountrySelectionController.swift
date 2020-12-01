//
//  FirstViewController.swift
//  Travory
//
//  Created by student on 9/4/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class CountrySelectionController: UIViewController {

    var selectedCountry = "Italy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectCountry(_ sender: Any) {
        let actionAlert = UIAlertController(title: "Options", message: "Pick a Country", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Italy", style: .default, handler: { _ in
            self.selectedCountry = "Italy"
        }));
        actionAlert.addAction(UIAlertAction(title: "United Kingdom", style: .default, handler: { _ in
            self.selectedCountry = "United Kingdom"
        }))
        actionAlert.addAction(UIAlertAction(title: "India", style: .default, handler: { _ in
            self.selectedCountry = "India"
        }))
        actionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(actionAlert, animated: true)
    }
}
