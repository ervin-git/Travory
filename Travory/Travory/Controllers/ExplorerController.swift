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
    var selectedCountry = ""
    var locations = [TravoryModel]()
    var selected = TravoryModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        let url = URL(string: "http://51.81.34.131/travory.json")
        if url != nil {
            download(url!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.contentMode = .scaleAspectFill
        tableView.backgroundView = backgroundImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "t_exp_info" {
            let infoController = segue.destination as! InfoController
            infoController.location = selected
        }
    }

    // table stuff
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // cell loading
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        let cell_image = cell.viewWithTag(1) as! UIImageView
        let cell_label = cell.viewWithTag(2) as! UILabel
        cell_label.textColor = UIColor.white
        cell_label.text = locations[indexPath.row].destination
        
        URLSession.shared.dataTask(with: URL(string: locations[indexPath.row].images[0])!, completionHandler: {(data, reponse, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                cell_image.image = UIImage(data: data!)
            }
        }).resume()
        return cell
    }
    
    // cell selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = locations[indexPath.row]
        self.performSegue(withIdentifier: "t_exp_info", sender: self)
    }
    
    // Data
    func download(_ url: URL) {
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let downloaded = data {
                self.decode(downloaded)
            } else if let error=error {
                print(error)
            }
        })
        task.resume()
    }
    
    func decode(_  data: Data) {
        do {
            let downloaded_info = try JSONDecoder().decode(Array<TravoryModel>.self, from: data)
            var temp = [TravoryModel]()
            for loc in downloaded_info {
                if loc.country == self.selectedCountry {
                    temp.append(loc)
                }
            }
            self.locations = temp
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error in decoding JSON data")
        }
    }
}
