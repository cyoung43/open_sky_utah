//
//  ContentView.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import SwiftUI
import MapKit

struct OpenSkyUtahView: View {
    @State private var region = Utah.region
    @ObservedObject var openSkyService = OpenSkyService()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                Map(coordinateRegion: $region, annotationItems: openSkyService.aircraftStates) { aircraftState in
                    MapAnnotation(coordinate: aircraftState.coordinate) {
                        AircraftView(aircraftState: aircraftState)
                    }
                }
                Button {
                    openSkyService.refreshStatus()
                } label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .imageScale(.large)
                        .padding()
                }
            }
                .navigationTitle("Utah Skies")
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OpenSkyUtahView()
    }
}
