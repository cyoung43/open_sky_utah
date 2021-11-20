//
//  Utah.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import Foundation
import MapKit

struct Utah {
    static let minLatitude = 37.0
    static let maxLatitude = 42.0
    static let minLongitude = -109.0
    static let maxLongitude = -114.0
    static let margin = 1.05
    
    static var center: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: (maxLatitude - minLatitude) / 2 + minLatitude, longitude: (maxLongitude - minLongitude) / 2 + minLongitude)
    }
    
    static var span: MKCoordinateSpan {
        MKCoordinateSpan(latitudeDelta: abs(maxLatitude - minLatitude) * margin, longitudeDelta: abs(maxLongitude - minLongitude) * margin)
    }
    
    static var region: MKCoordinateRegion {
        MKCoordinateRegion(center: center, span: span)
    }
}
