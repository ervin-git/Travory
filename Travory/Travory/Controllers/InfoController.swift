//
//  InfoPageController.swift
//  Travory
//
//  Created by student on 9/10/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit

class InfoController: UIViewController {

    var location = TravoryModel()
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
