//
//  InfoPageController.swift
//  Travory
//
//  Created by student on 9/10/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class InfoController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    var location = TravoryModel()
    var place = [TravoryModel]()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dest: UILabel!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var visit: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dest.text = self.location.destination
        print(self.location.info)
        
        URLSession.shared.dataTask(with: URL(string: location.images[0])!, completionHandler: {(data, reponse, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image.image = UIImage(data: data!)
            }
        }).resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seg" {
            let mapPage = segue.destination as! MapController
            mapPage.selected = location
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.location = place[indexPath.row]
        performSegue(withIdentifier: "seg", sender: self)
    }
    
    @IBAction func addToFav(_ sender: Any) {
        //link it to favorites page
    }
    
    @IBAction func goToMap(_ sender: Any) {
        
    }
    
}
