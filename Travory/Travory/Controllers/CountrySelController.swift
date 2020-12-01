//
//  FirstViewController.swift
//  Travory
//
//  Created by student on 9/4/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class CountrySelController: UIViewController {

    var selectedCountry = "Italy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "t_exp" {
            let expController = segue.destination as! ExplorerController
            expController.selectedCountry = self.selectedCountry
        }
    }
    
    @IBAction func selectCountry(_ sender: Any) {
        let actionAlert = UIAlertController(title: "Options", message: "Pick a Country", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Italy", style: .default, handler: { _ in
            self.selectedCountry = "Italy"
            self.performSegue(withIdentifier: "t_exp", sender: self)
        }));
        actionAlert.addAction(UIAlertAction(title: "United Kingdom", style: .default, handler: { _ in
            self.selectedCountry = "United Kingdom"
            self.performSegue(withIdentifier: "t_exp", sender: self)
        }))
        actionAlert.addAction(UIAlertAction(title: "India", style: .default, handler: { _ in
            self.selectedCountry = "India"
            self.performSegue(withIdentifier: "t_exp", sender: self)
        }))
        actionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(actionAlert, animated: true)
    }
}
