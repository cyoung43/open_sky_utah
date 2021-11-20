//
//  AircraftView.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import SwiftUI

struct AircraftView: View {
    @ObservedObject var openSkyStatus: OpenSkyService
    
    var aircraftState: AircraftState
    
    var body: some View {
        VStack {
            Image(systemName: "airplane")
                .rotationEffect(Angle(degrees: aircraftState.heading))
            if aircraftState.callsignIsVisible {
                Text(aircraftState.callsign ?? "")
            }
        }
        .onTapGesture {
            openSkyStatus.changeCallSignVisibility(visibility: !aircraftState.callsignIsVisible, aircraftState: aircraftState)
        }
    }
}
