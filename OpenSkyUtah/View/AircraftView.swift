//
//  AircraftView.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import SwiftUI

struct AircraftView: View {
    var aircraftState: AircraftState
    
    var body: some View {
        Image(systemName: "airplane")
            .rotationEffect(Angle(degrees: aircraftState.heading))
    }
}
