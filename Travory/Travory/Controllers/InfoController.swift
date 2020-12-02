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
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var dest: UILabel!
    @IBOutlet weak var info: UITextView!
    @IBOutlet weak var visitInfo: UITextView!
    @IBOutlet weak var favIcon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if (defaults.array(forKey: "T_Fav")?.count != 0) {
            let favArray = defaults.object(forKey: "T_Fav") as? [Int] ?? [Int]()
            if favArray.contains(location.id) {
                self.favIcon.imageView?.image = UIImage(systemName: "star")
            } else {
                self.favIcon.imageView?.image = UIImage(systemName: "star.fill")
            }
        }
        
        self.dest.text = self.location.destination

        if self.location.info.count == 1 {
            self.info.text = self.location.info[0]
        } else if self.location.info.count == 2 {
            self.info.text = self.location.info[0]
            self.visitInfo.text = self.location.info[1]
        }
        
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
    
    @IBAction func addToFav(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        if (defaults.array(forKey: "T_Fav")?.count != 0) {
            var favArray = defaults.object(forKey: "T_Fav") as? [Int] ?? [Int]()
            if favArray.contains(location.id) {
                let index = favArray.firstIndex(of: location.id) ?? nil
                if index != nil {
                    favArray.remove(at: index!)
                    defaults.set(favArray, forKey: "T_Fav")
                    self.favIcon.imageView?.image = UIImage(systemName: "star")
                }
            } else {
                favArray.append(location.id)
                defaults.set(favArray, forKey: "T_Fav")
                self.favIcon.imageView?.image = UIImage(systemName: "star.fill")
            }
        }
        
        print(defaults.object(forKey: "T_Fav") as? [Int] ?? [Int]())
    }
    
    @IBAction func goToMap(_ sender: Any) {
        performSegue(withIdentifier: "t_map", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "t_map" {
            let mapPage = segue.destination as! MapController
            mapPage.selected = location
        }
    }
}
