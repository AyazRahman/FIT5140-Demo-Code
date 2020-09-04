//
//  ViewController.swift
//  LocationDemo
//
//  Created by Ayaz Rahman on 1/9/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var currentLocation: CLLocationCoordinate2D?
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up location manager
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = 1
        locationManager.delegate = self
        
        // Check Authorization Status
        let authorizationStatus = CLLocationManager.authorizationStatus()
        // If not authorized ask for authorization
        if authorizationStatus == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        
        mapView.showsUserLocation = true
        
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        // Add annotation
        var location = LocationAnnotation(title: "Home", subtitle: "", lat: -37.9057858, lon: 145.1415167)
        mapView.addAnnotation(location)
        // Add the geofence
        let geoFence1 = CLCircularRegion(center: location.coordinate, radius: 50, identifier: location.title!)
        geoFence1.notifyOnExit = true
        geoFence1.notifyOnEntry = true
        
        focusOn(annotation: location)
        // Add another annotation
        location = LocationAnnotation(title: "IT Building", subtitle: "", lat: -37.910096, lon: 145.1350298)
        mapView.addAnnotation(location)
        // Add the geofence
        let geoFence2 = CLCircularRegion(center: location.coordinate, radius: 50, identifier: location.title!)
        geoFence2.notifyOnEntry = true
        geoFence2.notifyOnExit = true
        // Start monitoring
        locationManager.startMonitoring(for: geoFence1)
        locationManager.startMonitoring(for: geoFence2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    func focusOn(annotation: MKAnnotation){
        mapView.selectAnnotation(annotation, animated: true)
        
        let zoomRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    fileprivate func showAlert(_ regionName: String, _ title: String) {
        let alert = UIAlertController(title: title, message: "You are currently in \(regionName)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

// CLLocationManager delegate methods
extension ViewController{
    // Triggers when a location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            currentLocation = location.coordinate
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        showAlert(region.identifier, "Leaving Area")
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        showAlert(region.identifier, "Entering Area")
    }
    
}

