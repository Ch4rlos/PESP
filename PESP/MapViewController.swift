//
//  MapViewController.swift
//  PESP
//
//  Created by Developer on 2/26/20.
//  Copyright © 2020 CarlosQuiroga. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    var latitud : Double = 0.0
    var longitud : Double = 0.0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.startUpdatingLocation()
        
        
        
        let initialLocation = CLLocationCoordinate2D(latitude: CLLocationDegrees(self.latitud), longitude: CLLocationDegrees(self.longitud))
        
        //let regionRadius: CLLocationDistance = 10000
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialLocation
        mapView.addAnnotation(annotation)
    }
    
  
    

}



