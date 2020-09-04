//
//  LocationAnnotation.swift
//  LocationDemo
//
//  Created by Ayaz Rahman on 1/9/20.
//  Copyright © 2020 Ayaz Rahman. All rights reserved.
//

import UIKit
import MapKit

class LocationAnnotation: NSObject, MKAnnotation{
    
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, lat: Double, lon: Double) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
