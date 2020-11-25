//
//  splashController.swift
//  Travory
//
//  Created by student on 9/4/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class splashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2.5) {
            self.performSegue(withIdentifier: "intro", sender: nil)
        }
    }
    
}
