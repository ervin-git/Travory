//
//  MapController.swift
//  Travory
//
//  Created by student on 9/11/1399 AP.
//  Copyright © 1399 Ashish Nare. All rights reserved.
//

import UIKit
import MapKit
import UserNotifications

class MapController: UIViewController {
    
    var selected = TravoryModel()
    @IBOutlet weak var map: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        showMap()
    }
    
    func showMap() {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
        let placeLocation = CLLocationCoordinate2DMake(selected.lat, selected.long)
        let region = MKCoordinateRegion(center: placeLocation, span: span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        
        let loc = CLLocation(latitude: self.selected.lat, longitude: self.selected.long)
        CLGeocoder().reverseGeocodeLocation(loc) { (placemark, error) in
            if error != nil {
                print("Error in Map Loading")
                return
            }

            if let place = placemark?[0] {
                let annotation = MKPointAnnotation()
                annotation.coordinate = placeLocation
                annotation.title = "\(self.selected.destination)"

                //annotation.subtitle = "\(place.locality!), \(place.administrativeArea!), \(place.isoCountryCode!)"
                
                DispatchQueue.main.async {
                    self.map.addAnnotation(annotation)
                }
            }
        }
    }
    

}
