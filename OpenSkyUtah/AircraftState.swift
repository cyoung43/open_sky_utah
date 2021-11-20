//
//  AircraftState.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import Foundation
import CoreLocation
import UIKit

struct AircraftState: Identifiable {
    
    // MARK: - Position source
    enum PositionSource: Int {
        case adsb = 0
        case asterix = 1
        case mlat = 2
    }
    
    // MARK: - Properties
    var icao24: String
    var callsign: String?
    var originCountry: String
    var timePosition: Int?
    var lastContact: Int
    var longitude: Double?
    var latitude: Double?
    var baroAltitude: Double?
    var onGround: Bool
    var velocity: Double?
    var trueTrack: Double?
    var verticalRate: Double?
    var sensors: [Int]? = []
    var geoAltitude: Double?
    var squawk: String?
    var specialPurposeIndicator: Bool
    var positionSource: PositionSource
    
    var callsignIsVisible = false
    
    // MARK: - Initialization
    init(from row: [Any]) {
        icao24 = AircraftState.string(for: row[0])
        callsign = row[1] as? String
        originCountry = AircraftState.string(for: row[2])
        timePosition = row[3] as? Int
        lastContact = AircraftState.int(for: row[4])
        longitude = row[5] as? Double
        latitude = row[6] as? Double
        baroAltitude = row[7] as? Double
        onGround = AircraftState.boolean(for: row[8])
        velocity = row[9] as? Double
        trueTrack = row[10] as? Double
        verticalRate = row[11] as? Double
        geoAltitude = row[13] as? Double
        squawk = row[14] as? String
        specialPurposeIndicator = AircraftState.boolean(for: row[15])
        
        if let source = PositionSource(rawValue: AircraftState.int(for: row[16])) {
            positionSource = source
        }
        else {
            positionSource = .adsb
        }
    }
    
    // MARK: - Computed Props
    var coordinate: CLLocationCoordinate2D {
        if let lat = latitude, let lon = longitude {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        
        fatalError("Attempted to convert null coordinate")
    }
    
    var heading: Double {
        (trueTrack ?? 0.0) - 90
    }
    
    var id: String {
        icao24
    }
    
    // MARK: - Helpers
    static func boolean(for item: Any) -> Bool {
        if let value = item as? Bool {
            return value
        }
        
        fatalError("Unexpected converstion to boolean failed")
    }
    
    static func double(for item: Any) -> Double {
        if let value = item as? Double {
            return value
        }
        
        fatalError("Unexpected conversion to double failed")
    }
    
    static func int(for item: Any) -> Int {
        if let value = item as? Int {
            return value
        }
        
        fatalError("Unexpected conversion to int failed")
    }
    
    static func string(for item: Any) -> String {
        if let value = item as? String {
            return value
        }
        
        fatalError("Unexpected conversion to string failed")
    }
    
}
