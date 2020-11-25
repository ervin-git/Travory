//
//  FirstViewController.swift
//  Travory
//
//  Created by student on 9/4/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectCountry(_ sender: Any) {
        let actionAlert = UIAlertController(title: "Options", message: "Pick a Country", preferredStyle: .actionSheet)
        
        actionAlert.addAction(UIAlertAction(title: "Italy", style: .default))
        
        actionAlert.addAction(UIAlertAction(title: "United Kingdom", style: .default))
        
        actionAlert.addAction(UIAlertAction(title: "India", style: .default))
        
        actionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(actionAlert, animated: true)
    }
    


}

