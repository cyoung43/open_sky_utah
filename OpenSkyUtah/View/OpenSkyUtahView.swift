//
//  ContentView.swift
//  OpenSkyUtah
//
//  Created by Chris Young on 11/20/21.
//

import SwiftUI
import MapKit

struct OpenSkyUtahView: View {
    var body: some View {
        NavigationView {
            Map(coordinateRegion: <#T##Binding<MKCoordinateRegion>#>)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OpenSkyUtahView()
    }
}
