//
//  ListPageController.swift
//  Travory
//
//  Created by student on 9/10/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class ExplorerController: UITableViewController {
    let backgroundImage = UIImageView(image: UIImage(named: "backgroundExplore"))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImage
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
